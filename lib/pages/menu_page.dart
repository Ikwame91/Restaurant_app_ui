import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_restaurant_ui/components/favorite_foods.dart';
import 'package:simple_restaurant_ui/components/food_tile.dart';
import 'package:simple_restaurant_ui/constants/colors.dart';
import 'package:simple_restaurant_ui/constants/food_list.dart';
import 'package:simple_restaurant_ui/pages/food_details.dart';
import 'package:simple_restaurant_ui/widgets/custom_drawer.dart';
import 'package:simple_restaurant_ui/widgets/slider.dart';

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
        backgroundColor: abstractColor,
        appBar: AppBar(
          foregroundColor: Colors.grey[500],
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
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
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //promo banner
                SizedBox(height: 300, width: 400, child: PageSlide()),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text('Favorites Menu ',
                          style: GoogleFonts.roboto(
                              fontSize: 28,
                              color: Colors.red,
                              fontWeight: FontWeight.w500)),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/favoritepage');
                      },
                      icon: const Icon(
                        Icons.favorite_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                    )
                  ],
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
