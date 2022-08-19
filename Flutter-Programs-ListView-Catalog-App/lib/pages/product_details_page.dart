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
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.make(),
                    ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
                      shape: MaterialStateProperty.all(const StadiumBorder()), //rounder shape of button
                      ),
                      child: "Buy".text.make(),
                    ).wh(100,50)
                  ],
                ).p32(),
      ),

      body: SafeArea(        
        child: Column(
          children: [
            Hero( //give animation
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
            ),
            Expanded(              
              child: Container(
                width: context.screenWidth,
                child: Column(
                  children: [
                    //NAME
                     catalog.name.text.lg.color(MyTheme.darkBlue).bold.make(),
                       //DESCIRIPTION in caption
                       catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox, 
                  ],
                ).py64(),
              ),
            ),
          ],
        ).p16(),
      ),
    );
  }
}
