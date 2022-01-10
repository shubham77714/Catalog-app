import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widgets/homePageWidgets/catalog_header.dart';
import 'package:flutter_demo/widgets/homePageWidgets/catalog_list.dart';
import 'package:flutter_demo/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';



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
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartPage),
        backgroundColor: context.theme.highlightColor,
        child: const Icon(
          CupertinoIcons.cart,
          size: 35,  
        ),
      ).scale(scaleValue: 0.8),
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







