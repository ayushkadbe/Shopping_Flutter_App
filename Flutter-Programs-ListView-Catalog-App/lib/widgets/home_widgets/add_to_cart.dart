// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget { 
   final Item catalog;
  const AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    //If this happens -> then do this
    //VxState.listen is TO change the STATE of UI on trigger inside stateless widget
    //Here, AddMutation is Action of Adding a Item of an id. > Which will Redraw the widget
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    //get CartModel from store.dart
    final CartModel cart = (VxState.store as MyStore).cart;

    //UI: Check if CART contains item from catalog then TRUE or: FALSE
    bool isInCart = cart.items.contains(catalog);

    return ElevatedButton(
      onPressed: (){
        isInCart = isInCart.toggle(); //toggle when added
        //ADD ITEM TO CART only when isInCart i.e when there is item in cart
        if(!isInCart){
        AddMutation(catalog);
        }

      },
      style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
      shape: MaterialStateProperty.all(const StadiumBorder()), //rounder shape of button
      ),
      //Show Done when clicked add to cart and item is added
      child: isInCart? const Icon(Icons.done): const Icon(Icons.add_shopping_cart),
    );
  }
}
