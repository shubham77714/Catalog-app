import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import "package:flutter_demo/widgets/theme.dart";

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.color(MyTheme.darkBluishColor).bold.make(),
        "Trending Products".text.xl2.color(Colors.black).make(),

      ],
    );
  }
}