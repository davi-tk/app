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
        ChangeNotifierProvider(create: (_) => Post()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            builder: (context) => const CreatePost()))
                  }),
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}

class CreatePost extends StatelessWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = "Nova anotação";
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
