// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/utils/routes.dart';
import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int hours = 8;

  final String name = "PiedPiper";

  //JSON CATALOG URL
  final url = "https://api.npoint.io/8d733da5ae7ebfe8581f";

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
    // final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
       //OR
    final response = await http.get(Uri.parse(url));  //this gives response from url
    final catalogJson = response.body;  //get json data 
    

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
    final cart = (VxState.store as MyStore).cart;


    //create a list to check what
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      //cream color so that WHITE COLOR OF CARD can be HIGHLIGHTED

      //CART BUTTON on homepage floating
      floatingActionButton: VxConsumer(
        mutations: const {AddMutation, RemoveMutation},
        builder:(ctx, _, __) => Badge(
          position: BadgePosition.topEnd(top: 0, end: 3),
          badgeContent: Text(
             cart.items.length.toString(),
             style: const TextStyle(color: Colors.white),
          ),
          child: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),           
            child: const Icon(CupertinoIcons.cart),
          ),       
         
        ),
      ),
      /* child: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder:(ctx, _, __) =>  FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),           
            child: const Icon(CupertinoIcons.cart),
          )
        ), */
      //https://www.geeksforgeeks.org/flutter-implementing-badges/
      //.badge(color: Vx.white, size: 20, count: _cart.items.length, textstyle: TextStyle(color: Colors.black, fontweight: bold))
      

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






