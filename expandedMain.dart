
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiple Child Class',
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
    //do not return scaffold as we don't need app bar etc, but our custome text on center
    return Center(
      child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Row(
            //We are using ROW to align the CHILDREN Elements in ROW
            children: [
              //Expanded: It allows to make the children of a Row and Column widget to occupy the maximum possible area.
              Expanded(
                child: Text('Ayush', textAlign: TextAlign.center),
              ),
              Expanded(
                child: Text(
                  'John',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                  child: FittedBox(
                fit: BoxFit.contain,
                child: const FlutterLogo(),
              ))
            ],
          )),
    );
  }
}
