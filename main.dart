import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiple Widget Layout",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      //Center > Container > Stack > Children > Container
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
              height: 400.0,
              width: 300,
            ),
            Container(
              color: Colors.green,
              height: 220,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
