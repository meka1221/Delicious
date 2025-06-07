import 'package:flutter/material.dart';

class PizzaModel {
  String name;
  String image;
  Color colorBox;
  List<String> toppings;
  List<String> speciesLevel;
  String description;
  double price;

  PizzaModel({
    required this.name,
    required this.image,
    required this.colorBox,
    required this.toppings,
    required this.speciesLevel,
    required this.description,
    required this.price,
  });

  static List<PizzaModel> getMainListPizzas() {
    return [
      PizzaModel(
        name: 'Margherita Pizza',
        image: 'assets/images/margherita_pizza.jpg',
        colorBox: const Color(0xffffe5b4),
        toppings: ['Mozzarella', 'Tomato Sauce', 'Basil'],
        speciesLevel: ['Mild', 'Medium Spicy', 'Very Spicy'],
        description: 'Classic Italian pizza with fresh mozzarella, '
            'tangy tomato sauce and basil leaves.',
        price: 7.5,
      ),
      PizzaModel(
        name: 'Pepperoni Pizza',
        image: 'assets/images/pepperoni_pizza.jpg',
        colorBox: const Color(0xfff9c2c2),
        toppings: ['Pepperoni', 'Cheese', 'Tomato Sauce'],
        speciesLevel: ['Mild', 'Medium Spicy', 'Very Spicy'],
        description: 'All-time favorite pizza with spicy pepperoni and '
            'melting cheese over a tomato base.',
        price: 8.5,
      ),
      PizzaModel(
        name: 'Veggie Pizza',
        image: 'assets/images/veggie_pizza.jpg',
        colorBox: const Color(0xffd4fcd7),
        toppings: ['Bell Peppers', 'Olives', 'Onions', 'Tomatoes'],
        speciesLevel: ['Mild', 'Medium Spicy', 'Very Spicy'],
        description: 'Loaded with fresh vegetables and flavors, perfect '
            'for a healthy choice.',
        price: 7.0,
      ),
    ];
  }
}
