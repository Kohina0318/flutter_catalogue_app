import "package:flutter/material.dart";
import 'package:flutter_cataloge/core/store.dart';
import 'package:flutter_cataloge/pages/cart_page.dart';
import 'package:flutter_cataloge/utills/routes.dart';
import 'package:flutter_cataloge/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
       debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.CartRoute: (context) => const CartPage(),
      },
    );
  }
}
