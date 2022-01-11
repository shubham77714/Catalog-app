import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

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



}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart!._itemIds.add(item.id);
  }

}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart!._itemIds.remove(item.id);
  }

}