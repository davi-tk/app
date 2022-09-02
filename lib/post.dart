import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:http/http.dart' as http;

part 'post.g.dart';

class PostState with ChangeNotifier, DiagnosticableTreeMixin {
  @Id()
  int id = Isar.autoIncrement;
  late String _content;
  late String _title;
  late String _label = 'Trabalho';
  List<Post> posts = [];

  String get content => _content;
  void setContent(String content) {
    _content = content;
    notifyListeners();
  }

  String get title => _title;
  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  String get label => _label;
  void setLabel(String label) {
    _label = label;
    notifyListeners();
  }

  Post salvar() {
    final post = Post()
      ..content = _content
      ..title = _title
      ..label = _label;

    return post;
  }

  Future<http.Response> createPost() {
  return http.post(
    Uri.parse('http://127.0.0.1:8000/posts/posts/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      
    },
    body: jsonEncode(<String, String>{
      'title': _title,
      'label': _label,
      'content': _content,
    }),
  );
}

  readPosts(IsarCollection<Post> postCollection) async {
    List<Post?> newPosts = await postCollection.where().findAll();
    posts = newPosts as List<Post>;
    notifyListeners();
  }

  List<Widget> buildWidgets() {
    List<Widget> widgets = [];
    for (var element in posts) {
      widgets.add(Card(
        color: Colors.white60,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  element.title,
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  element.label,
                )
              ],
            ),
            const Divider(color: Colors.indigo),
            Text(element.content,
            style: const TextStyle(fontSize: 20))
          ]),
        ),
      ));
    }
    return widgets;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('content', content));
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('label', label));
  }
}

@Collection()
class Post with ChangeNotifier, DiagnosticableTreeMixin {
  @Id()
  int id = Isar.autoIncrement;
  late String content;
  late String title;
  late String label;
}
