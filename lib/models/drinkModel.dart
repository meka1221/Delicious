import 'package:flutter/material.dart';

class DrinkModel {
  String name;
  String image;
  Color colorBox;
  List<String> ingredients;
  List<String> speciesLevel;
  String description;
  double price;

  DrinkModel({
    required this.name,
    required this.image,
    required this.colorBox,
    required this.ingredients,
    required this.speciesLevel,
    required this.description,
    required this.price,
  });

  static List<DrinkModel> getMainListDrinks() {
    return [
      DrinkModel(
        name: 'Lemonade Fresh',
        image: 'assets/images/lemonade.jpg',
        colorBox: const Color(0xffd0f0fd),
        ingredients: ['Lemon', 'Sparkling Water', 'Mint'],
        speciesLevel: ['No Sugar', 'Medium Sweet', 'Sweet'],
        description: 'Refreshing lemonade made with fresh lemons and mint. '
            'Perfect for a hot day!',
        price: 3.5,
      ),
      DrinkModel(
        name: 'Berry Smoothie',
        image: 'assets/images/berry_smoothie.jpg',
        colorBox: const Color(0xfffcd0f5),
        ingredients: ['Strawberry', 'Blueberry', 'Yogurt'],
        speciesLevel: ['No Sugar', 'Medium Sweet', 'Sweet'],
        description: 'A sweet and healthy blend of fresh berries and yogurt. '
            'Full of vitamins!',
        price: 4.0,
      ),
      DrinkModel(
        name: 'Iced Coffee',
        image: 'assets/images/iced_coffee.jpg',
        colorBox: const Color(0xffe0d4c1),
        ingredients: ['Coffee', 'Milk', 'Ice'],
        speciesLevel: ['No Sugar', 'Medium Sweet', 'Sweet'],
        description: 'Chilled coffee with a smooth taste. '
            'Great energy booster for your day.',
        price: 3.8,
      ),
    ];
  }
}
