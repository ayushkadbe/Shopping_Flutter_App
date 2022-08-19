import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/pages/product_details_page.dart';
import 'package:myapp/widgets/theme.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';


//CatalogList shows the items fetched using CatalogItem constructor in the ListView.builder  
class CatalogList extends StatelessWidget{
  const CatalogList({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
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
    return VxBox(
      //ROW: TO SHOW ITEMS like Image, Price, desc etc
     
      child: Row(
        //wrapped IMAGE in a BOX
        children: [
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
                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      // backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
                    shape: MaterialStateProperty.all(const StadiumBorder()), //rounder shape of button
                    ),
                    child: "Add to cart".text.make(),
                  )
                ],
              ).pOnly(right: 8),
            ],
          ))
        ],
      )
    ).color(context.canvasColor).rounded.square(150).make().py16();
    //py16 is padding of 16 between ROW ITEM , which creates a CARD with roundedLg for rounded corners
  }
}
