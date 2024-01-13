import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_restaurante/components/button.dart';
import 'package:menu_restaurante/presentation/models/food_model.dart';
import 'package:menu_restaurante/themes/colors.dart';
import 'package:provider/provider.dart';

import '../models/shop_model.dart';

class FoodDetailsPages extends StatefulWidget {
  final Food food;
  const FoodDetailsPages({super.key, required this.food});

  @override
  State<FoodDetailsPages> createState() => _FoodDetailsPagesState();
}

class _FoodDetailsPagesState extends State<FoodDetailsPages> {
  int quantityCount = 0;

  void showAlertDialogOnOkCallback(String title, String msg,
      DialogType dialogType, BuildContext context, VoidCallback onOkPres) {
    AwesomeDialog(
            context: context,
            animType: AnimType.topSlide,
            dialogType: dialogType,
            title: title,
            desc: msg,
            btnOkIcon: Icons.check_circle,
            btnOkColor: Colors.green.shade900,
            btnOkOnPress: onOkPres)
        .show();
  }

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  //add to card
  void addToCart() {
    if (quantityCount > 0) {
      //accion
      final shop = context.read<Shop>();
      //agregar
      shop.addToCart(widget.food, quantityCount);
      //let
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            'agregado con exito',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Sushi'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[800],
      ),
      body: Column(
        children: [
          //list view
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //rating

                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // description

                  Text(
                    'Descripcion',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Es un platillo principal y super recomendado por turistas y por personas locales  hay muchas formas de prepararlos",
                    style: TextStyle(color: Colors.grey[600], height: 2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                //pricce
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.food.price}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        //button
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                        //cantidad
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //add cart

                MyButton(
                  text: "Agregar",
                  onTap: addToCart,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
