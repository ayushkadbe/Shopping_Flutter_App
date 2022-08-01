import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int hours = 8;
  final String name = "PiedPiper";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Widget",
        ),
      ),

      body: Center(
        child: Container(
          child: Text("Welcome to $hours of flutter with $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
