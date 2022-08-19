import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/theme.dart';
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int hours = 8;

  final String name = "PiedPiper";

  @override
  //initState(): It initializes a Class, You get data when a Widget is not built, Build method is not called
  void initState(){
    super.initState();
    //create a method loadData() to get data from assets/catalog.json file
    loadData();
  }
  
  //method to fetch data from json files
  loadData()async {
    await Future.delayed(const Duration(seconds: 1));
    //rootBundle to fetch DATA In string, takes time so await & store in catalogJson
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    //Json decoder(string to map) and encoder
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];  
    //get list of mapped Items in catalog.json decoded constructor
    CatalogModel.items = List.from(productData) //taking list from product map
      .map<Item>((item)=> Item.fromMap(item)) //.map as taking from map convert to Item data from
      .toList();                                //convert to list
    setState(() {
      //this is will reload the data
    });

  }


  //when their are less items in catalog.dart then self generate items for UI testing
  @override
  Widget build(BuildContext context){
    //create a list to check what
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      //cream color so that WHITE COLOR OF CARD can be HIGHLIGHTED

      //CART BUTTON on homepage floating
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute), 
        backgroundColor: MyTheme.darkBlue,
        child: const Icon(CupertinoIcons.cart),
      ),
      

    //listview builder gives recylerView for list, it renders other items of list only on scrolling
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header
              const CatalogHeader(), //import the HEADER FROM catalog_header.dart Class
              //Get ITEM LIST from CatalogModel.items after a non null CHECK
              if(CatalogModel.items.isNotEmpty)
                const CatalogList().expand() //CatalogList class from catalog_list.dart class
              else
                Center(child: const CircularProgressIndicator().centered().expand(),)
            ],
          ),
        ),
      ),
    );
  }
}






