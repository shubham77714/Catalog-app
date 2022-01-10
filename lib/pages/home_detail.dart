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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar:  ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price}".text.bold.scale(1.5).color(Colors.brown.shade600).make(),
          ElevatedButton(
            onPressed: (){}, 
            child: "Add to Cart".text.scale(1).make(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))
                )
              ),
            ),  
          ).wh(110,40)
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
                      15.heightBox,
                      "Ere werud sydou wylag en kynzathul ezes ne hullothya iunhum kyth. Buol nym num en nym werud, ullyetuk hioll buol olelothya scepsegud bua, wklelue viragnac urodum sydou ozuk myth bezzeg, en ozuk keguggethuk urumemtuul scegenul ygoz. Iunhum halallal halallal byuntelen syrolmol volek hyul illen. Engumet eggedum epedek syrolmom eggen scemem."
                        .text.scale(1.18).make().p(20),
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