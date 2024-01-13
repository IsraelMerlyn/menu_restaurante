// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_restaurante/components/button.dart';
import 'package:menu_restaurante/components/drawer.dart';
import 'package:menu_restaurante/components/foot_tile.dart';
import 'package:menu_restaurante/presentation/Screen/foodDetails.dart';

import 'package:menu_restaurante/presentation/models/shop_model.dart';
import 'package:menu_restaurante/themes/colors.dart';
import 'package:provider/provider.dart';

class MenuPages extends StatefulWidget {
  const MenuPages({super.key});

  @override
  State<MenuPages> createState() => _MenuPagesState();
}

class _MenuPagesState extends State<MenuPages> {
  //navigate

  void navigateToFoodDetails(int index) {
    //get the shop
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPages(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get the shop
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'Tokyo',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpages');
              },
              icon: const Icon(Icons.shopping_bag))
        ],
      ),
      drawer: MyDrawer(),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     //promo banner

      //     Container(
      //       decoration: BoxDecoration(
      //           color: primaryColor, borderRadius: BorderRadius.circular(20)),
      //       margin: const EdgeInsets.symmetric(horizontal: 25),
      //       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           //promo
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 'Descuento 35%',
      //                 style: GoogleFonts.dmSerifDisplay(
      //                     fontSize: 20, color: Colors.white),
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               //boton

      //               MyButton(
      //                 text: 'promo',
      //                 onTap: () {},
      //               )
      //             ],
      //           ),

      //           // image

      //           Image.asset(
      //             'assets/img/sushis.png',
      //             width: 100,
      //           )
      //         ],
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 25,
      //     ),

      //     // search bar

      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 25.0),
      //       child: TextField(
      //         decoration: InputDecoration(
      //             focusedBorder: OutlineInputBorder(
      //               borderSide: const BorderSide(color: Colors.white),
      //               borderRadius: BorderRadius.circular(20),
      //             ),
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: const BorderSide(color: Colors.white),
      //               borderRadius: BorderRadius.circular(20),
      //             ),
      //             hintText: 'Busca aqui!'),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 20,
      //     ),

      //     // menu list

      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //       child: Text(
      //         'Food Menu',
      //         style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             color: Colors.grey[800],
      //             fontSize: 18),
      //       ),
      //     ),

      //     const SizedBox(
      //       height: 10,
      //     ),

      //     // popular food
      //     Expanded(
      //       child: ListView.builder(
      //         scrollDirection: Axis.horizontal,
      //         itemCount: foodMenu.length,
      //         itemBuilder: (context, index) => FootTile(
      //           food: foodMenu[index],
      //           onTap: () => navigateToFoodDetails(index),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 20,
      //     ),
      //     Container(
      //       decoration: BoxDecoration(
      //         color: Colors.grey[100],
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //       margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      //       padding: const EdgeInsets.all(20),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Row(
      //             children: [
      //               Image.asset(
      //                 'assets/img/sushi3.png',
      //                 height: 60,
      //               ),
      //               const SizedBox(
      //                 width: 20,
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     "salmon",
      //                     style: GoogleFonts.dmSerifDisplay(fontSize: 18),
      //                   ),
      //                   const SizedBox(
      //                     height: 10,
      //                   ),
      //                   Text(
      //                     "\$21.00",
      //                     style: TextStyle(
      //                       color: Colors.grey[700],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //           Icon(
      //             Icons.favorite_outline,
      //             color: Colors.grey[600],
      //             size: 28,
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
