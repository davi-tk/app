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
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      home: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              color: Colors.blue,
              width: 850,
              height: 850,
            ),
            Container(
              color: Colors.orange,
              width: 850,
              height: 850,
            ),
            Container(
              color: Colors.green,
              width: 850,
              height: 850,
            ),
          ],
        ),
      ),
    );
  }
}
