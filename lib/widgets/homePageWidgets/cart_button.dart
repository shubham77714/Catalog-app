import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/models/cart.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartButton extends StatelessWidget {
  const CartButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return VxBuilder(
        mutations: const {AddMutation,RemoveMutation},
        builder: (context,_,status){
          return FloatingActionButton(
            onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartPage),
            backgroundColor: context.theme.highlightColor,
            child: const Icon(
              CupertinoIcons.cart,
              size: 35,  
            ),
          ).scale(scaleValue: 0.8).badge(
            color: Colors.amber.shade800,
            size: 18,
            type: VxBadgeType.round,
            count: _cart!.items.length,
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600
            )
          );
        }
      );
  
  }
}