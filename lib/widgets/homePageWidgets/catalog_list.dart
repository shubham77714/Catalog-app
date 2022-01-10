import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/pages/home_detail.dart';
import 'package:flutter_demo/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context,index){
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>
              HomeDetailsPage(catalog: catalog)
            ),
          ),
          child: CatalogItem(catalog:catalog)
        );
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
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.color(MyTheme.darkBluishColor).bold.make(),
                catalog.desc.text.make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.make(),
                    ElevatedButton(
                      onPressed: (){}, 
                      child: "Add to Cart".text.make(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                      ),  
                    )
                  ],
                ).pOnly(right: 2),
              ],
            ),
          ),
        ],
      )
    ).color(MyTheme.creamColor).rounded.square(150).make().py8();
  }
}
