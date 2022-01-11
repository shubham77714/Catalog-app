import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/widgets/homePageWidgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';


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
      backgroundColor: context.canvasColor,
      bottomNavigationBar:  ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price}".text.color(context.theme.hintColor).bold.scale(1.5).make(),
          AddToCart(catalog: catalog).wh(90,40),
        ],
      ).px32().py8().backgroundColor(context.cardColor),
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
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.color(context.theme.highlightColor)
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
        ),
      ),
    );
  }
}