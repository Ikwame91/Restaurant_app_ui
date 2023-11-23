import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_restaurant_ui/constants/colors.dart';
import 'package:simple_restaurant_ui/constants/food_list.dart';
import 'package:simple_restaurant_ui/models/food.dart';
import 'package:simple_restaurant_ui/widgets/custom_container.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key, required this.food});
  final Food food;
  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  //
  int quantity = 0;
  double calculateTotalPrice() {
    return quantity * widget.food.price;
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  //add to cart
  void addToCart() {
    //add to cart
    //only add to cart if thers quantity in the cart
    if (quantity > 0) {
      //get access to shop
      final shop = context.read<FoodShop>();

      //add to cart
      shop.addToCart(widget.food, quantity);
      //let the user know it was syccessful
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            'successfully added item',
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          actions: [
            //okay button
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.image,
                    height: 320,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 252, 227, 5),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.food.rating,
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 25, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Description',
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.description,
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                //price

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text(
                        '\$${calculateTotalPrice()}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: decrementQuantity,
                              icon: const Icon(Icons.remove)),
                        ),

                        //text

                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(quantity.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                          ),
                        ),
                        //increment quantity
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                              onPressed: incrementQuantity,
                              icon: const Icon(Icons.add)),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                CustomContainer(
                  text: 'Add to Cart',
                  onTap: () => addToCart(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
