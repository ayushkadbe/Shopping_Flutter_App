//ONE file contains Model of Items
class CatalogModel{
  static List<Item> items=[];

  //GET ITEM BY ID METHOD
  //custom method =          get firstWhere (element)  => whose element.id == my id
  static Item getById(int id) => items.firstWhere((element) => element.id == id, orElse: null);

  //GET ITEM BY POSITION
  static Item getByPosition(int pos) => items[pos];
}

//Other file contains Structuring of Data Model
class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  //create a Named Constructur for variables
  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
  
  //How to represent data of catalog using Catalog.json files
  //create a Constructor & tell it that Data is comming from Catalog.json & then create Objects according to it.

  //Item is already is constructor > we are creating it's named constructor using .
  //factory constructor that can be used when you don't necessarily want a constructor to create a new instance of your class.
  
  //DECODING DATA: String to MAP, our id in map is String which is product

  factory Item.fromMap(Map<String,dynamic>map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
      
    );
  }

  //ENCODING DATA: MAP to String
  toMap()=>{
    //for id key : add value
    "id": id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image,

  };


}
