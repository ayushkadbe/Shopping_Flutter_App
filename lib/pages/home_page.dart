import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int hours = 8;
  final String name = "PiedPiper";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold Widget"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $hours of flutter with $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
