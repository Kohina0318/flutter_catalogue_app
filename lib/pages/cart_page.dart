import 'package:flutter/material.dart';
import 'package:flutter_cataloge/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.theme.primaryColor).make(),
      ),
    );
  }
}