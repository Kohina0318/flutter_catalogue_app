import 'package:flutter/material.dart';
import 'package:flutter_cataloge/models/cart.dart';
import "package:velocity_x/velocity_x.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
          children: [
            _CartList().p32().expand(),
            Divider(),
            _CartTotal(),
          ],
        ),
    );
  }
}

class _CartTotal extends StatelessWidget {  

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4.color(context.theme.primaryColor).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                content:"Buying not Supported yet.".text.make()
              ));
            },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.theme.floatingActionButtonTheme.backgroundColor)
          ), 
          child: "Buy".text.white.make()).w32(context)
        ],
      ),
    );
  }
}


class _CartList extends StatelessWidget{
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty ? 
    "Nothing to Show".text.xl2.makeCentered()
    : ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context,index)=>ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: (){
            _cart.remove(_cart.items[index]);
            
          },
          ),
          title: _cart.items[index].name.text.make(),
      )
      );
  }
}