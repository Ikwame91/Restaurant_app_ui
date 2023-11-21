import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_restaurant_ui/widgets/custom_container.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 121, 3),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 30,
                  ),

                  //Shop Name
                  Text(
                    'VILAINS PIZZA',
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 28, color: Colors.white),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Image(
                      image: AssetImage('lib/images/pizza.png'),
                      width: 270,
                      height: 270,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'THE TASTE OF GHANAIAN FOODS',
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 44, color: Colors.white),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Feel the taste of our Delicious meal and snacks with our special recipes',
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //button
                  CustomContainer(
                    text: 'Get Started',
                    onTap: () {
                      Navigator.pushNamed(context, '/menupage');
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
