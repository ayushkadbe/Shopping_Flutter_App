// ignore: import_of_legacy_library_into_null_safe
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/catalog.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  //Models object
  late CatalogModel catalog;
  late CartModel cart;

  //MyStore Constructor
  MyStore(){
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog; //give cart access to catalog for getting items
  }


}

//USE  final CartModel _cart = (VxState.store as MyStore).cart; where you NEED CatalogModel or CartModel
//    final CatalogModel _catalog = (VxState.store as MyStore).catalog;
