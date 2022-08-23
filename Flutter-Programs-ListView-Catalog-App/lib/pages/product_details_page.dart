// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:myapp/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class ProductDetails extends StatelessWidget {
  //This is NAVIGATION to PRODUCT DETAILS PAGE.
  final Item catalog;

  const ProductDetails({Key? key,  required this.catalog}) : super(key: key);
 

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: AppBar(), //for backbutton
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.color(context.canvasColor).xl4.make(),
                    AddToCart(catalog: catalog,).wh(120,40),
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
                color: context.canvasColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    //NAME
                     catalog.name.text.lg.color(context.primaryColor).bold.make(),
                       //DESCIRIPTION in caption
                       catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox, 
                      "This is a dummy text, for a dummy phone. Don't what I am typing, so just ignore it and see how elegant is design of the app."
                      .text
                      .textStyle(context.captionStyle)
                      .make()
                      .p20()  
                      

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
