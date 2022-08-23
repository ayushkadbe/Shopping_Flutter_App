//HEADER widget
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget{
  const CatalogHeader({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl5.bold.color(context.primaryColor).make(),
              "Trending Products".text.xl2.color(context.primaryColor).make(),
            ],
    );
  }
}