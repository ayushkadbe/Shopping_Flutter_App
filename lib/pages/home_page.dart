import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/item_widget.dart';
import '../widgets/drawer.dart';
import 'dart:convert';
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
    await Future.delayed(Duration(seconds: 1));
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
      appBar: AppBar(
        title: const Text("Catalog App",
        style: TextStyle(
          color: Colors.black,
        ),),
      ),

    //listview builder gives recylerView for list, it renders other items of list only on scrolling
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)? ListView.builder(
          //what item to display
          itemCount: CatalogModel.items.length,
          //how to display
          itemBuilder: (context, index){
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          },
          //show progress bar on checking while conditional statement on line 60
        ): const Center(
          child: CircularProgressIndicator(),
        )
      ),
      drawer: MyDrawer(),
    );
  }
}
