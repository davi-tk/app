import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

void main() => runApp(MyApp());

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
