import 'dart:developer';

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
    _genre++;
    print(_genre);
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
    return Scaffold(
      body: Center(
        child: Column(
          children: const <Widget>[
            Text("Você apertou:"),
            Count(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Human>().setGenre(1),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.watch<Human>().genre; 
    return Text('$state');
  }
}
