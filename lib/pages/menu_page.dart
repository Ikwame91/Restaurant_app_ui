import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_restaurant_ui/constants/food_list.dart';
import 'package:simple_restaurant_ui/pages/food_tile.dart';
import 'package:simple_restaurant_ui/widgets/custom_container.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    super.key,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          foregroundColor: Colors.grey[500],
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            'Ghana',
            style:
                GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //promo banner
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 121, 3),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //promo message
                          Text(
                            'Get 50% Promo',
                            style: GoogleFonts.dmSerifDisplay(
                                fontSize: 20, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          //button
                          const CustomContainer(text: 'Redeem')
                        ],
                      ),
                      Image.asset(
                        'lib/images/fufuone.png',
                        height: 180,
                      )
                    ],
                  ),
                ),
                //search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                // popular food
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Food Menu ',
                      style: GoogleFonts.robotoSlab(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 370,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodMenu.length,
                      itemBuilder: (context, index) =>
                          FoodTile(food: foodMenu[index])),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'lib/images/fufuone.png',
                        height: 100,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
