import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_demo/widgets/theme.dart';


class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({ Key? key,required this.catalog }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar:  ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price}".text.bold.scale(1.5).color(Colors.brown.shade600).make(),
          ElevatedButton(
            onPressed: (){}, 
            child: "Buy".text.scale(1.3).make(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))
                )
              ),
            ),  
          ).wh(90,40)
        ],
      ).px32().py8().backgroundColor(MyTheme.creamColor),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image).box.make()
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 15,
                arcType: VxArcType.CONVEX,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.brown.shade100,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.color(MyTheme.darkBluishColor)
                        .xl3.bold.make(),
                      10.heightBox,
                      catalog.desc.text.make(),
                    ],
                  ).py32(),
                ),
              ),
            ),
          ],
        ).py4(),
      ),
    );
  }
}