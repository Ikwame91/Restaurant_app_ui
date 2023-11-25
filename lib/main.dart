import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_restaurant_ui/constants/food_list.dart';
import 'package:simple_restaurant_ui/pages/cart_page.dart';
import 'package:simple_restaurant_ui/pages/favorite_page.dart';
import 'package:simple_restaurant_ui/pages/intro_page.dart';
import 'package:simple_restaurant_ui/pages/login.dart';
import 'package:simple_restaurant_ui/pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FoodShop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodySmall: TextStyle(color: Colors.black),
          ),
        ),
        home: const LoginPage(),
        routes: {
          '/loginpage': (context) => const LoginPage(),
          '/intropage': (context) => const IntroPage(),
          '/menupage': (context) => const MenuPage(),
          '/cartpage': (context) => const CartPage(),
          '/favoritepage': (context) => const FavoritePage(),
        });
  }
}
