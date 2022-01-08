import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/widgets/drawer.dart';
import 'package:flutter_demo/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList =List.generate(50,(index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: dummyList.length,  
        itemBuilder: (context,index){
          return ItemWidget(
            item: dummyList[index],
          );
        },
      ),
    );
  }
}