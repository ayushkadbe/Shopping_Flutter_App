// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


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
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [        
        "\$999".text.xl5.color(Theme.of(context).primaryColor).make(),
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: (){},
        ),
        title: "Item 1".text.make(),
      ),
    );
  }
}