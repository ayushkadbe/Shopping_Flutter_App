import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget { 
   final Item catalog;
  AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);


  final _cart = CartModel();
  

  @override
  Widget build(BuildContext context) {
    //UI: Check if CART contains item from catalog then TRUE or: FALSE
    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
      onPressed: (){
        isInCart = isInCart.toggle(); //toggle when added
        //ADD ITEM TO CART only when isInCart i.e when there is item in cart
        if(!isInCart){
          isInCart = isInCart.toggle();
        final _catalog = CatalogModel();
        _cart.catalog = _catalog;  //_catalog is set, so that list mapping in CartModel works.
        _cart.add(catalog);
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
