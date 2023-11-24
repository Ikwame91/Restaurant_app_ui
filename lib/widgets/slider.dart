import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_restaurant_ui/constants/food_list.dart';
import 'package:simple_restaurant_ui/widgets/custom_container.dart';

class PageSlide extends StatelessWidget {
  PageSlide({super.key});
  final FoodShop foodShop = FoodShop();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: foodShop.foodmenu.length,
          options: CarouselOptions(
            height: 350,
            autoPlay: true,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            final shop = context.read<FoodShop>();
            final foodMenu = shop.foodmenu;
            return Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 121, 3),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          child: Image.asset(
                            foodMenu[itemIndex].image,
                            width: 150,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Get 50% off',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const CustomContainer(text: ' Redeem your coupon ')
                ],
              ),
            );
          },
        ));
  }
}
