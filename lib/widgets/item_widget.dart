
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catalog.dart';


class ItemWidget extends StatelessWidget{
  final Item item;
  const ItemWidget({Key? key,required this.item})
    : assert(item!= null),
      super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.imageURL),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.2,
          style: const TextStyle(
            color:  Colors.deepPurple,
            fontWeight: FontWeight.bold
            ),
        ),
      ),
    );
  }
  
  
  
}