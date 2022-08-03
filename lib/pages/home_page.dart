import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/catalog.dart';
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
      appBar: AppBar(
        title: const Text("Catalog App",
        style: TextStyle(
          color: Colors.black,
        ),),
      ),

    //listview builder gives recylerView for list, it renders other items of list only on scrolling
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)?
        //GRIDVIEW
        GridView.builder(
          //how many grids in a row
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index){
            final item = CatalogModel.items[index];

            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //GRIDTILE
              child: GridTile(
                //HEADER
                header: Container(
                  child: Text(item.name, style: const TextStyle(color: Colors.white),),
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                ),

                child: Image.network(
                  item.image,                  
                ),

                //FOOTER
                footer: Container(
                  child: Text(item.price.toString(), style: const TextStyle(color: Colors.white),),
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
            
              ),
            );

          },
          itemCount: CatalogModel.items.length,
          
        )
          //show progress bar on checking while conditional statement on line 60
        : const Center(
          child: CircularProgressIndicator(),
        )
      ),
      drawer: const MyDrawer(),
    );
  }
}
