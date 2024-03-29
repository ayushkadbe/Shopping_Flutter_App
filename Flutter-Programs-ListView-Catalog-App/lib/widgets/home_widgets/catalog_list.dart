// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/pages/product_details_page.dart';
import 'package:myapp/utils/routes.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';
import 'catalog_image.dart';

//CatalogList shows the items fetched using CatalogItem constructor in the ListView.builder  
class CatalogList extends StatelessWidget{
  const CatalogList({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return !context.isMobile? GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 20),

      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        //final catalog = CatalogModel.items[index]; ORg =
        final catalog = CatalogModel.items[index];
        return InkWell(
          //Navigate from homeScreen to ProductDetails Page of Item of that Catalog
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context)=> ProductDetails(
              catalog: catalog,
              )
            )
          ),
          child: CatalogItem(catalog: catalog, key: null,));
          
        },
          
      
    ):ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        //final catalog = CatalogModel.items[index]; ORg =
        final catalog = CatalogModel.items[index];
        return InkWell(
          //Navigate from homeScreen to ProductDetails Page of Item of that Catalog
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context)=> ProductDetails(
              catalog: catalog,
              )
            )
          ),

          //OR for product id in url
          //  onTap: () => context.vxNav.push(Uri(path: MyRoutes.productDetailsRoute, queryParameters: {"id": catalog.id.toString()}), params: catalog), 
          child: CatalogItem(catalog: catalog, key: null,));
          
        },
    );

    
  }
}

//Get CatalogItem for CatalogList using a CatalogItems constructor
class CatalogItem extends StatelessWidget{
  final Item catalog;
  const CatalogItem({required Key? key, required this.catalog}): super(key: key);
  @override
  Widget build(BuildContext context){
    //ADD ITEMS TO BE SHOWS ON LIST
    var children2 = [
          CatalogImage(image: catalog.image,),
          //expanded text aligned right center to the card box
          Expanded(child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //NAME
              catalog.name.text.lg.color(context.primaryColor).bold.make(),
              //DESCIRIPTION in caption
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              //BUTTON
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog),  //pass catalog to add widget
                ],
              ).pOnly(right: 8),
            ],
          ).p(context.isMobile?0: 16),
          )
        ];
    return VxBox(
      //ROW: TO SHOW ITEMS like Image, Price, desc etc
     
      child: context.isMobile? Row(
        //wrapped IMAGE in a BOX
        children: children2,
      ):Column(children: children2,)
    ).color(context.canvasColor).rounded.square(150).make().py16();
    //py16 is padding of 16 between ROW ITEM , which creates a CARD with roundedLg for rounded corners
  }
}

