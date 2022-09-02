// ignore_for_file: avoid_print

import 'package:app/post.dart';
import 'package:flutter/gestures.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//Classe para permitir Scrollagem em aplicação Web
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await Isar.open(schemas: [PostSchema]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostState()),
      ],
      child: MyApp(isar: isar),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Isar isar;
  const MyApp({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(isar: isar),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Isar isar;
  const MyHomePage({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PostState>().readPosts(isar.posts);
    String title = "Meu Diário";
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
                onPressed: (() => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreatePost(isar: isar)))
                    }),
                icon: const Icon(Icons.add))
          ],
        ),
        body: ListView(
          children: context.watch<PostState>().buildWidgets(),
        ));
  }
}

class CreatePost extends StatelessWidget {
  final Isar isar;
  const CreatePost({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> labels = [
      const DropdownMenuItem<String>(
          value: 'Trabalho', child: Text('Trabalho')),
      const DropdownMenuItem<String>(value: 'Escola', child: Text('Escola')),
      const DropdownMenuItem<String>(value: 'Casa', child: Text('Casa')),
      const DropdownMenuItem<String>(
        value: 'Compras',
        child: Text('Compras'),
      )
    ];
    String title = "Nova anotação";
    String hintDropDown = "Selecione uma categoria";
    String hintTitle = "Dê um título para sua anotação";
    String hintContent = "Qual o conteúdo da sua anotação?";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 120, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hintDropDown),
              DropdownButton(
                  items: labels,
                  value: context.watch<PostState>().label,
                  onChanged: (label) =>
                      context.read<PostState>().setLabel(label as String)),
              const SizedBox(height: 60),
              TextField(
                decoration: InputDecoration(
                    labelText: hintTitle, border: const OutlineInputBorder()),
                onChanged: (title) => context.read<PostState>().setTitle(title),
              ),
              const SizedBox(height: 60),
              Text(hintContent),
              TextField(
                maxLines: 8, //or null
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (content) =>
                    context.read<PostState>().setContent(content),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                  onPressed: () async {
                    var ctx = context.read<PostState>();
                    Post post = ctx.salvar();
                    ctx.createPost();
                    await isar
                        .writeTxn((isar) async => await isar.posts.put(post));
                    await ctx.readPosts(isar.posts);

                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }
}
