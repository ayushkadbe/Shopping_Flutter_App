import 'package:flutter/material.dart';
import 'package:myapp/widgets/theme.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

//CatalogImage: Returns Image from Image.network
class CatalogImage extends StatelessWidget{
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);
  
  @override 
  Widget build(BuildContext context){
    //this is the Box of Image inside the CARD LIKE BOX of the List
    return Image.network(image)
        .box.rounded.p8.color(context.canvasColor).make().p16().w40(context);
  }
}