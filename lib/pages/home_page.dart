import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/widgets/drawer.dart';
import 'package:flutter_demo/widgets/item_widget.dart';
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
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items!.isNotEmpty)
                const CatalogList().expand()
              else
                const Center(child: CircularProgressIndicator(),)
              
            ],
          ),
        ),
      ),
    );
  }
}


class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context,index){
        final catalog = CatalogModel.items![index];
        return CatalogItem(catalog:catalog);
      }
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({ Key? key,required this.catalog }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.color(Colors.deepPurpleAccent).bold.make(),
                catalog.desc.text.make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.make(),
                    ElevatedButton(
                      onPressed: (){}, 
                      child: "Buy".text.make(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),  
                    )
                  ],
                ).pOnly(right: 2),
              ],
            ),
          ),
        ],
      )
    ).white.rounded.square(150).make().py8();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({ Key? key,required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image
    ).box.rounded.p1.color(Colors.grey).make().p12().w40(context).h20(context);
  }
}


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.color(Colors.black).bold.make(),
        "Trending Products".text.xl2.color(Colors.black54).make(),

      ],
    );
  }
}