class CatalogModel{

  //catalog field
  CatalogModel? _catalog;
  CatalogModel? get catalog => _catalog;

  static List<Item>? items ;

  //get items by Id
  Item getById(int id) => 
    items!.firstWhere((element) => element.id== id, orElse: (null));

  //get items by position
  Item getByPos(int index) =>  items![index];

}

class Item{
  final int id;
  final String brand;
  final String name;
  final String desc;
  final String price;
  final String image;

  Item({required this.id,required this.brand ,required this.name, required this.desc, required this.price, required this.image});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"], 
      brand: map["brand"],
      name: map["name"], 
      desc: map["description"], 
      price: map["price"],  
      image: map["image_link"],
    );
  }

  toMap() => {
    "id":id,
    "brand":brand,
    "name":name,
    "description":desc,
    "price":price,
    "image_link":image,
  };
  
}

