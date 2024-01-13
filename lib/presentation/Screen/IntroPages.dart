import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_restaurante/components/button.dart';

class IntroPages extends StatelessWidget {
  const IntroPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 25,
              ),

              //shop name
              Text(
                'SHISHI MAN',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28, color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),

              // icon
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'assets/img/tuna.png',
                ),
              ),
              // title
              Text(
                'El Taste es comida de Japon',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 35, color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),
              // subtitle
              Text(
                'La mejor comida Tina es la mejor de japon y del mundo entero',
                style:
                    TextStyle(color: Colors.grey[200], fontSize: 18, height: 2),
              ),
              const SizedBox(
                height: 25,
              ),

              MyButton(
                text: 'Inicio',
                onTap: () =>
                    //get to menu
                    Navigator.pushNamed(context, '/homemenupages'),
              )
              // get start button
            ]),
      ),
    );
  }
}
