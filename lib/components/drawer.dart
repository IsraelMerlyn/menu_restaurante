import 'package:flutter/material.dart';
import 'package:menu_restaurante/components/my_ttitle.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: Colors.grey[300],

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header: logo
              const DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 70,
                    color: Color.fromARGB(255, 138, 60, 55),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //shop title
              MyTitle(
                  text: "Inicio",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context)),
              //cart title
              MyTitle(
                text: "Carrito",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cartpages');
                },
              ),
              MyTitle(
                  text: "Ajustes",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/settingpages');
                  }),
            ],
          ),
          //exit shop title
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyTitle(
              text: "Salir",
              icon: Icons.exit_to_app,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intropage', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
