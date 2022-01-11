import 'package:flutter_demo/models/catalog.dart';

class CartModel{
  //catalog field
  CatalogModel? _catalog;     // use underscore to make private

  // collect products id
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel? get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel? catalog){
    assert(catalog!=null);
    _catalog = catalog;
  }

  //get items in cart.  list is generate using their ids
  List<Item> get items => 
      _itemIds.map((id) => _catalog!.getById(id)).toList();

  //get total price
  int get totalPrice => 
      items.fold(0, (total, element) => total+=element.price);

  //add item to cart
  void add(Item item){
    _itemIds.add(item.id);
  }

  //remove item from cart
  void remove(Item item){
    _itemIds.remove(item.id);
  }



}