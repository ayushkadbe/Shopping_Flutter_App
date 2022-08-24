// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/cart.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        foregroundColor: Theme.of(context).primaryColor,
        title: "Cart".text.xl3.make(),
      ),

      //LETS SHOW THE LIST OF ITEMS inside PLACEHOLDER, which is _CartList in this case
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

//TOTOL ITEMS, PRICE & BUY BUTTON
class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     //create a METHOD calling CartModel CLASS
      final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: const {RemoveMutation},
            builder: (context, _, __){
             return "\$${_cart.totalPrice}".text.xl5.color(Theme.of(context).primaryColor).make();
          },),
          //totalPrice method called using CLASS OBJECT _card        
        
        30.widthBox,
        ElevatedButton(
          onPressed: () {},
          child: "Buy".text.white.xl2.make(),
        ).wh(110,45),
      ]),
    );
  }
}

//ITEM LIST METHOD
class _CartList extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
     //create a METHOD calling CartModel CLASS
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty?"Add Items to Cart to show!".text.xl3.makeCentered(): ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          //remove items from cart
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: ()=>
            RemoveMutation(_cart.items[index]),
            
        ),
        //item name from index called using CLASS OBJECT _card
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}