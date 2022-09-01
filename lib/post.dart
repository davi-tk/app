import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

part 'post.g.dart';

@Collection()
class Post with ChangeNotifier, DiagnosticableTreeMixin {
  @Id()
  int id = Isar.autoIncrement;
  late String _content;
  late String _title;
  late DateTime _date;
  late String categoria;

  String get content => _content;

  String get title => _title;

  DateTime get date => _date;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('content', content));
    properties.add(StringProperty('title', title));
  }
}
