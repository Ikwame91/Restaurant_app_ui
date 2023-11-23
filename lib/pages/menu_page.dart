import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_restaurant_ui/components/favorite_foods.dart';
import 'package:simple_restaurant_ui/components/food_tile.dart';
import 'package:simple_restaurant_ui/constants/food_list.dart';
import 'package:simple_restaurant_ui/pages/food_details.dart';
import 'package:simple_restaurant_ui/widgets/custom_container.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    super.key,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetails(int index) {
    //get the shop and its menu

    final shop = context.read<FoodShop>();
    final foodMenu = shop.foodmenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetails(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<FoodShop>();
    final foodMenu = shop.foodmenu;
    final favoriteFoods = shop.foodfavorites;
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            )
          ],
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
                        itemBuilder: (context, index) => FoodTile(
                              food: foodMenu[index],
                              onTap: () => navigateToFoodDetails(index),
                            ))),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Favorites Menu ',
                      style: GoogleFonts.robotoSlab(
                          fontSize: 28,
                          color: Colors.red,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height - 500,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: favoriteFoods.length,
                        itemBuilder: (context, index) => FavoriteFoods(
                              food: favoriteFoods[index],
                            ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
