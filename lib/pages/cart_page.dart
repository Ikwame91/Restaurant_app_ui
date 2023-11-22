import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_restaurant_ui/constants/colors.dart';
import 'package:simple_restaurant_ui/constants/food_list.dart';
import 'package:simple_restaurant_ui/models/food.dart';
import 'package:simple_restaurant_ui/widgets/custom_container.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<FoodShop>();

    //remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodShop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text('My Cart'),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    //get food from cart
                    final Food food = value.cart[index];

                    //get food name
                    final String foodname = food.name;

                    //get food price
                    final double foodprice = food.price;
                    //return list tile
                    return Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          foodname,
                          style: GoogleFonts.notoSansArabic(
                              fontSize: 22, color: Colors.white),
                        ),
                        subtitle: Text(
                          foodprice.toString(),
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onPressed: () => removeFromCart(food, context),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomContainer(
                text: 'Pay Now',
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
