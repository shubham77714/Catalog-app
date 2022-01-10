import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({ Key? key,required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image
    ).box.rounded.p1.color(context.theme.canvasColor).make().p12().w40(context).h20(context);
  }
}