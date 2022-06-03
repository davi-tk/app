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
  double _height = 120;
  double _waist = 40;
  int _idade = 0;

  //Get e Set para Idade
  int get idade => _idade;
  void setIdade(int idade) {
    _idade = idade;
  }

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
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                child: const GenderSelector()),
            const Text("Circunferência de Cintura:"),
            Slider(
              value: context.watch<Human>().waist,
              onChanged: (waist) => context.read<Human>().setWaist(waist),
              min: 40,
              max: 100,
            ),
            const Cintura(),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 50, bottom: 200),
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Insira sua idade"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  )
                },
                child: const Icon(Icons.navigate_next_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text('Selecione sua altura'),
          RotatedBox(
            quarterTurns: 1,
            child: SizedBox(
              width: 500,
              child: Slider(
                value: context.watch<Human>().height,
                onChanged: (height) => context.read<Human>().setHeight(height),
                label: context.watch<Human>().height.toStringAsFixed(2),
                divisions: 80,
                min: 120,
                max: 200,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => {
                  Navigator.pop(context),
                },
                child: const Icon(Icons.navigate_before_outlined),
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultPage(),
                    ),
                  ),
                },
                child: const Icon(Icons.navigate_next_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var altura = context.watch<Human>().height;
    var genero = context.watch<Human>().genre;
    var cintura = context.watch<Human>().waist;

    var resultado = -20 * (altura / cintura);
    resultado += genero == 0 ? 76 : 64;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
                "O Resultado da sua Massa Gorda Relativa é ${resultado.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.headline5),
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            child: const Icon(Icons.navigate_before_outlined),
          ),
        ],
      ),
    );
  }
}

class Cintura extends StatelessWidget {
  const Cintura({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        context.watch<Human>().waist.toStringAsFixed(1),
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline4);
  }
}

class GenderSelector extends StatelessWidget {
  const GenderSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: const Text('Feminino'),
            leading: Radio<int>(
              value: 0,
              groupValue: context.watch<Human>().genre,
              onChanged: (value) => {context.read<Human>().setGenre(value!)},
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text('Masculino'),
            leading: Radio<int>(
              value: 1,
              groupValue: context.watch<Human>().genre,
              onChanged: (value) => {context.read<Human>().setGenre(value!)},
            ),
          ),
        ),
      ],
    );
  }
}
