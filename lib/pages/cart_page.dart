import 'package:flutter/material.dart';
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
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "99999".text.xl3.color(context.theme.hintColor).make(),
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context,index){
        return ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            onPressed: (){},
            icon: Icon(Icons.cancel),
          ),
          title: "Sample 1".text.make(),
        );
      }
    );
  }
}