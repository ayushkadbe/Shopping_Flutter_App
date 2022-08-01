import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';

class ItemWidget extends StatelessWidget{

  //class object of class Item
  final Item item;

  //constructor of class object
  const ItemWidget({Key? key, required this.item}) : assert(item !=null), super(key: key);
    

  @override
  Widget build(BuildContext context){
    //IN listView use ListTile() widget for adding showing items,
    
    //Show each Item of ListView inside a Card
    return Card(
      child: ListTile(
        onTap:() {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}