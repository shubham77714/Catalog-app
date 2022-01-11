import 'package:flutter/material.dart';
import 'package:flutter_demo/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          const _CartList().p32().expand(),       //placeholder is used to block some part
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl3.color(context.theme.hintColor).make(),
          50.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet".text.make(),
                  duration: const Duration(seconds: 1),
                )
              );
            }, 
            child: "Buy".text.scale(1.32).make(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.theme.highlightColor),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(20, 30))
              )),
            ),
          ).w32(context)
        ],
      ),
    );
  }
}


class _CartList extends StatefulWidget {
  const _CartList({ Key? key }) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        "Cart is empty".text.color(context.theme.hintColor).scale(2.5).make().py12(),
        "Add products to your cart".text.color(context.theme.primaryColor).scale(1.3).make()
      ],
    )
      :ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index){
        return ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            onPressed: (){
              _cart.remove(_cart.items[index]);
              setState(() {});
            },
            icon: const Icon(Icons.cancel),
          ),
          title: _cart.items[index].name.text.make(),
        );
      }
    );
  }
}