import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/widgets/drawer.dart';
import 'package:flutter_demo/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  void initState() {
    super.initState();
    loadState();
  } 

  loadState() async{
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items =List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (CatalogModel.items!=null && CatalogModel.items!.isNotEmpty)
          ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemCount: CatalogModel.items!.length, 
            itemBuilder: (context,index) {
              final item = CatalogModel.items![index];
              return Card(
                clipBehavior: Clip.antiAlias,
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                shadowColor: Colors.red,
                child: GridTile(
                  header: Container(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      item.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  child: Image.network(item.image),
                  footer:  Container(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "\$${item.price}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }
          )
        :const Center(
          child: CircularProgressIndicator(),
        ),
      )
    );
  }
}