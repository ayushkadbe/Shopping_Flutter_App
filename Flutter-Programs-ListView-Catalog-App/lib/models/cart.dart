// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{
  

  //CATALOG MODEL data flow ALGORITHM: -----------------

  //Catalog Field from catalog.dart model
  //i.e CatalogModel _CATALOG OBJECT
  late CatalogModel _catalog;

  //IDS COLECTION = store id of each item
  final List<int> _itemIds = [];

  //Get Catalog
  //i.e access data of _CATALOG OBJECT from new object "CATALOG"
  CatalogModel get catalog => _catalog;

  //Set catalog
  //assign data from _CATALOG OBJECT to  "NEW CATALOG of CART"
  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
  }
 
  //Map Items of NEW CATALOG of CART to IDs
  //get list of item from items => assign mapped( data to  => IDs.).toList();
  List <Item> get items => _itemIds.map((id)=> _catalog.getById(id)).toList();


  //Total Method
  //get Total Price   => for loop condition logic initial price is ZERO for total, current ) => add current.price to total
  // for ITEM 1 total 0, current price = total + current price of item 1 let say 900
  // for ITEM 2 total 900, current price = 900 + current price of item 2
  num get totalPrice => items.fold(0, (total, current)=> total + current.price);

 
}

 //Add Item Method
//mutation means any Action in flutter
    //in "current _itemIds" add new "item.id" from "Item item list"
class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }

}

//REMOVE ITEM FROM CART
class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }

}