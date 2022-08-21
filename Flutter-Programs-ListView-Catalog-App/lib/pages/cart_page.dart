// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //totalPrice method called using CLASS OBJECT _card        
        "\$${_cart.totalPrice}".text.xl5.color(Theme.of(context).primaryColor).make(),
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
class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  //create a METHOD calling CartModel CLASS
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty?"Add Items to Cart to show!".text.xl3.makeCentered(): ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          //remove items from cart
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: (){
            _cart.remove(_cart.items[index]);
            setState(() {
              
            });
          },
        ),
        //item name from index called using CLASS OBJECT _card
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}