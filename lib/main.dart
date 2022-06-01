// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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

void main() => {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Human()),
          ],
          child: const MyApp(),
        ),
      )
    };

class Human with ChangeNotifier, DiagnosticableTreeMixin {
  int _genre = 0;
  double _height = 0;
  double _waist = 0;

  //Get e Set pra Gênero
  int get genre => _genre;
  void setGenre(int genre) {
    _genre = genre;
    notifyListeners();
  }

  //Get e Set para altura
  double get height => _height;
  void setHeight(double height) {
    _height = height;
    notifyListeners();
  }

  //Get e Set para cintura
  double get waist => _waist;
  void setWaist(waist) {
    _waist = waist;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('genre', genre));
    properties.add(DoubleProperty('height', height));
    properties.add(DoubleProperty('waist', waist));
  }
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
    var genero = context.watch<Human>().genre;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Descubra seu corpo"),
      ),
      body: Center(
        child: Column(
          children: const [
            GenderSelector(),
            Count(),
          ],
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        '${context.watch<Human>().genre}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline4);
  }
}

class GenderSelector extends StatelessWidget {
  const GenderSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Mulher'),
          leading: Radio<int>(
            value: 0,
            groupValue: context.watch<Human>().genre,
            onChanged: (value) => {context.read<Human>().setGenre(value!)},
          ),
        ),
        ListTile(
          title: const Text('Homem'),
          leading: Radio<int>(
            value: 1,
            groupValue: context.watch<Human>().genre,
            onChanged: (value) => {context.read<Human>().setGenre(value!)},
          ),
        ),
      ],
    );
  }
}
