import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_restaurant_ui/constants/colors.dart';
import 'package:simple_restaurant_ui/constants/food_list.dart';
import 'package:simple_restaurant_ui/models/food.dart';
import 'package:simple_restaurant_ui/widgets/custom_button.dart';
import 'package:simple_restaurant_ui/widgets/custom_container.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<FoodShop>();

    //remove from cart
    shop.removeFromCart(food);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${food.name} removed from cart'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Undo the removal by adding the item back at the original index
            shop.addToCart(food, shop.cart.length);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double containerheight = (screenSize.height * 0.35);
    double containerwidth = (screenSize.width * 0.35);
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
                      width: screenSize.width,
                      height: screenSize.height * 0.38,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[400] as Color,
                          width: 3,
                        ),
                      ),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: containerheight * 0.8,
                                    width: containerwidth * 0.8,
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                            value.cart[index].image)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  foodname,
                                  style: GoogleFonts.roadRage(
                                      fontSize: 30, color: Colors.black),
                                ),
                                Text(
                                  foodprice.toString(),
                                  style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 15, left: 10, top: 15),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 12),
                                  child: CustomButton(
                                      onPressed: () =>
                                          removeFromCart(food, context),
                                      color: Colors.white,
                                      width: 80,
                                      height: 35,
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                                CustomButton(
                                  onPressed: () {},
                                  color: Colors.white,
                                  width: 100,
                                  height: 35,
                                  child: const Text(
                                    'Save for later',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
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




// Container(
//                       decoration: BoxDecoration(
//                           color: secondaryColor,
//                           borderRadius: BorderRadius.circular(15)),
//                       margin: const EdgeInsets.all(10),
//                       child: ListTile(
                        // title: Text(
                        //   foodname,
                        //   style: GoogleFonts.notoSansArabic(
                        //       fontSize: 22, color: Colors.white),
                        // ),
//                         subtitle: Text(
//                           foodprice.toString(),
//                           style: const TextStyle(
//                               fontSize: 22, color: Colors.white),
//                         ),
//                         trailing: IconButton(
//                           icon: const Icon(
//                             Icons.delete,
//                             color: Colors.white,
//                           ),
//                           onPressed: () => removeFromCart(food, context),
//                         ),
//                       ),
//                     );