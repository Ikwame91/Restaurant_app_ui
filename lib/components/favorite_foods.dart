import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_restaurant_ui/models/food.dart';

class FavoriteFoods extends StatelessWidget {
  const FavoriteFoods({
    super.key,
    required this.food,
    this.onTap,
  });
  final Food food;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
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
                    food.image,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        '\$${food.price}',
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
              const Icon(Icons.favorite_outline, color: Colors.red, size: 30),
            ],
          ),
        ],
      ),
    );
  }
}
