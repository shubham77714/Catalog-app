import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/models/cart.dart';
import 'dart:convert';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widgets/homePageWidgets/cart_button.dart';
import 'package:flutter_demo/widgets/homePageWidgets/catalog_header.dart';
import 'package:flutter_demo/widgets/homePageWidgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final url = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

@override
  void initState() {
    super.initState();
    loadState();
  } 

  loadState() async{
    await Future.delayed(const Duration(seconds: 2));

    // final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body ;

    final decodedData = jsonDecode(catalogJson);
    // var productsData = decodedData["products"];
    CatalogModel.items =List.from(decodedData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: const CartButton(),       // cart button
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items!.isNotEmpty)
                const CatalogList().py8().expand()
              else
                const CircularProgressIndicator().centered().expand(),
              
            ],
          ),
        ),
      ),
    );
  }
}







