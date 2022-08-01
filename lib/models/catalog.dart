//ONE file contains Model of Items
class CatalogModel{
  static final item= [
    Item(
      id: 1,
      name: "iphone 13",
      desc: "Screen 5.5 inch",
      price: 999,
      color: "white",
      image: "https://m.media-amazon.com/images/I/71GLMJ7TQiL._SL1500_.jpg",
    ),

    Item(
      id: 2,
      name: "iphone 12",
      desc: "Screen 5.5 inch",
      price: 799,
      color: "blue",
      image: "https://m.media-amazon.com/images/I/71ZOtNdaZCL._SL1500_.jpg",
    )

  ];
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
}
