import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_restaurant_ui/constants/colors.dart';
import 'package:simple_restaurant_ui/constants/food_list.dart';
import 'package:simple_restaurant_ui/models/food.dart';

class FavoriteFoods extends StatefulWidget {
  const FavoriteFoods({
    super.key,
    required this.food,
    this.onTap,
  });
  final Food food;
  final void Function()? onTap;

  @override
  State<FavoriteFoods> createState() => _FavoriteFoodsState();
}

class _FavoriteFoodsState extends State<FavoriteFoods> {
  bool isliked = false;
  void addToFavorites() {
    setState(() {
      isliked = !isliked;
    });
    //only add to cart if there's quantity in the cart
    if (isliked) {
      //get access to shop
      final shop = context.read<FoodShop>();

      //add to cart
      shop.addToFavorites(
        widget.food,
      );

      //let the user know it was successful
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: secondaryColor,
          content: const Text(
            'Successfully added item to favorites',
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          actions: [
            //okay button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }
  }

// void addToCart() {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.food.image,
                    height: 80,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        '\$${widget.food.price}',
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
              Expanded(
                child: IconButton(
                  onPressed: addToFavorites,
                  icon: Icon(
                    isliked ? Icons.favorite : Icons.favorite_outline,
                    color: const Color(0xFF530601),
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
