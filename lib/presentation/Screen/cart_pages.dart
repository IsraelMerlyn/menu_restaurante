import 'package:flutter/material.dart';
import 'package:menu_restaurante/components/button.dart';
import 'package:menu_restaurante/themes/colors.dart';
import 'package:provider/provider.dart';

import '../models/food_model.dart';
import '../models/shop_model.dart';

class CartPages extends StatelessWidget {
  const CartPages({super.key});

  void removeFromCart(Food food, BuildContext context) {
    //
    final shop = context.read<Shop>();

    //method

    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          title: const Text(
            'My Cart',
          ),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            //

            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  //get food from cart
                  final Food food = value.cart[index];

                  //get food name
                  final String foodName = food.name;

                  final String foodPrice = food.price;

                  return Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                          onPressed: () => removeFromCart(food, context),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey[300],
                          )),
                    ),
                  );
                },
              ),
            ),

            //button pay
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: 'Pagar Ahora',
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
