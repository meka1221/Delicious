import 'package:flutter/material.dart';

class SushiModel {
  String name;
  String image;
  Color colorBox;
  List<String> speciesLevel;
  String description;
  double price;

  SushiModel({
    required this.name,
    required this.image,
    required this.colorBox,
    required this.speciesLevel,
    required this.description,
    required this.price,
  });

  static List<SushiModel> getMainListSushi() {
    return [
      SushiModel(
        name: 'Salmon Sushi',
        image: 'assets/images/chesse_burger.jpg',
        colorBox: const Color(0xfffce4ec), // light pink
        speciesLevel: [
          'Fresh Salmon',
          'Spicy Sauce',
          'Rice Vinegar Balance',
        ],
        description: 'Delicious fresh salmon with perfect rice balance. '
            'A classic Japanese taste. '
            'Ideal for sushi lovers.',
        price: 7.0,
      ),
      SushiModel(
        name: 'Tuna Sushi',
        image: 'assets/images/hot_pepper_burger.jpg',
        colorBox: const Color(0xffe3f2fd), // light blue
        speciesLevel: [
          'Premium Tuna',
          'Mild Soy Flavor',
          'Wasabi Accent',
        ],
        description: 'Smooth tuna slice with authentic flavor. '
            'Balanced by mild soy and wasabi. '
            'Perfect for any occasion.',
        price: 8.0,
      ),
      SushiModel(
        name: 'Vegetarian Sushi',
        image: 'assets/images/vegget_burger.jpg',
        colorBox: const Color(0xffe8f5e9), // light green
        speciesLevel: [
          'Avocado & Cucumber',
          'Sweet Soy Glaze',
          'Sesame Crunch',
        ],
        description: 'Fresh vegetarian option with creamy avocado. '
            'Crunchy cucumber, topped with sesame and glaze. '
            'A healthy delight.',
        price: 6.0,
      ),
    ];
  }
}
