// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import '../widgets/theme.dart';

class ProductDetails extends StatelessWidget {
  //This is NAVIGATION to PRODUCT DETAILS PAGE.
  final Item catalog;

  const ProductDetails({Key? key,  required this.catalog}) : super(key: key);
 

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(), //for backbutton

      body: SafeArea(        
        child: Column(
          children: [
            Hero( //give animation
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
            ),
          ],
        ).p16(),
      ),
    );
  }
}
