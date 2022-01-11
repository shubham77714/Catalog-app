import 'package:flutter/material.dart';
import 'package:flutter_demo/models/cart.dart';
import 'package:flutter_demo/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({Key? key,required this.catalog,}) 
    : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: (){
        if(isInCart==false){
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
        
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);      
          setState(() {});
        }
      }, 
      child: isInCart ? const Icon(Icons.done):"Add to Cart".text.make(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.highlightColor),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),  
    );
  }
}