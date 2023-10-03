import 'package:flutter/material.dart';
import 'package:menu_restaurante/presentation/Screen/IntroPages.dart';
import 'package:menu_restaurante/presentation/Screen/cart_pages.dart';
import 'package:menu_restaurante/presentation/Screen/menuPages.dart';
import 'package:menu_restaurante/presentation/models/shop_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // const MyApp(),
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
      home: const IntroPages(),
      routes: {
        '/intropage': (context) => const IntroPages(),
        '/menupages': (context) => const MenuPages(),
        '/cartpages': (context) => const CartPages(),
      },
    );
  }
}
