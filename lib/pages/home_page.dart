import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/item_widget.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int hours = 8;
  final String name = "PiedPiper";

  //when their are less items in catalog.dart then self generate items for UI testing
  //final dummyList = List.generate(20, ((index) => CatalogModel.item[0])); replacing CatalogModel.item in ListView with dummyList

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
        child: ListView.builder(
          //what item to display
          itemCount: CatalogModel.item.length,
          //how to display
          itemBuilder: (context, index){
            return ItemWidget(
              item: CatalogModel.item[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
