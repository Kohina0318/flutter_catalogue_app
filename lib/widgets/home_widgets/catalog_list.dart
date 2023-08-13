import 'package:flutter/material.dart';
import 'package:flutter_cataloge/models/cart.dart';
import 'package:flutter_cataloge/pages/home_detail_page.dart';
import "package:velocity_x/velocity_x.dart";
import '../../models/catalog.dart';
import '../themes.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.item.length,
        itemBuilder: (context, index) {
          // final catalog = CatalogModel.getByPosition(index);
          final catalog = CatalogModel.item[index];
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.primaryColor).make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  _AddToCart(catalog: catalog),
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py4();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  // const _AddToCart({super.key});
const _AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle();
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              context.theme.floatingActionButtonTheme.backgroundColor),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
        child: isAdded ? Icon(Icons.done) : "Add to cart".text.make());
  }
}
