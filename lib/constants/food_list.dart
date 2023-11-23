import 'package:flutter/material.dart';
import 'package:simple_restaurant_ui/models/food.dart';

class FoodShop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: 'Banku & okro stew',
      image: 'lib/images/bankuone.png',
      description:
          'Pizza is a savory dish of Italian origin consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven.',
      price: 10.99,
      category: 'Pizza',
      rating: '4.5',
      id: '1',
      quantity: 1,
    ),
    Food(
      name: 'fufu & palm soup',
      image: 'lib/images/fufuone.png',
      description:
          'A beef (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled.',
      price: 5.99,
      category: 'Burger',
      rating: '4.5',
      id: '2',
      quantity: 1,
    ),
    Food(
      name: 'yam & palava sauce',
      image: 'lib/images/yamone.png',
      description:
          'Pasta is a type of Italian food typically made from an unleavened dough of wheat flour mixed with water or eggs, and formed into sheets or various shapes, then cooked by boiling or baking.',
      price: 8.99,
      category: 'steak',
      rating: '4.2',
      id: '3',
      quantity: 1,
    ),
    Food(
        name: 'fufu & light soup',
        image: 'lib/images/fufuthree.png',
        description:
            'A salad is a dish consisting of a mixture of small pieces of food, usually vegetables or fruits. However, different varieties of salad may contain virtually any type of ready-to-eat food.',
        price: 6.99,
        category: 'Salad',
        rating: '4.0',
        id: '4',
        quantity: 1),
    Food(
        name: 'fufu & goat soup',
        image: 'lib/images/fufutwo.png',
        description:
            'fufu is a ghanaian dish with goat soup and it is very delicious and tasty its the favorite food of most Ghanaians in the country and outside the country it has a special taste and and is a very healthy food',
        price: 8.5,
        category: 'local dish',
        rating: '4.0',
        id: '5',
        quantity: 1)
  ];
  final List<Food> _foodFavorites = [
    Food(
      name: 'Banku & okro stew',
      image: 'lib/images/awakye.png',
      description:
          'Pizza is a savory dish of Italian origin consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven.',
      price: 10.99,
      category: 'Pizza',
      rating: '4.5',
      id: '1',
      quantity: 1,
    ),
    Food(
      name: 'fufu & palm soup',
      image: 'lib/images/chicken.png',
      description:
          'A beef (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled.',
      price: 5.99,
      category: 'Burger',
      rating: '4.5',
      id: '2',
      quantity: 1,
    ),
    Food(
      name: 'yam & palava sauce',
      image: 'lib/images/gob.png',
      description:
          'Pasta is a type of Italian food typically made from an unleavened dough of wheat flour mixed with water or eggs, and formed into sheets or various shapes, then cooked by boiling or baking.',
      price: 8.99,
      category: 'steak',
      rating: '4.2',
      id: '3',
      quantity: 1,
    ),
    Food(
        name: 'fufu & light soup',
        image: 'lib/images/nip.png',
        description:
            'A salad is a dish consisting of a mixture of small pieces of food, usually vegetables or fruits. However, different varieties of salad may contain virtually any type of ready-to-eat food.',
        price: 6.99,
        category: 'Salad',
        rating: '4.0',
        id: '4',
        quantity: 1),
  ];
//customers cart
  List<Food> cart = [];
  List<Food> favorites = [];

//getter methods
  List<Food> get foodmenu => _foodMenu;
  List<Food> get foodfavorites => _foodFavorites;
  List<Food> get cartItems => cart;
  List<Food> get favorItems => favorites;

//add to cart
  void addToCart(Food fooditems, int quantity) {
    for (int i = 0; i < quantity; i++) {
      cart.add(fooditems);
      notifyListeners();
    }
  }

//add to favorites
  void addToFavorites(Food food) {
    favorites.add(food);
    notifyListeners();
  }

  void removeFromFavorites(Food food) {
    favorites.remove(food);
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    cart.remove(food);
    notifyListeners();
  }
}
