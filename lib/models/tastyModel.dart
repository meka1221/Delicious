import 'dart:ui';

class TastyModel {
  String name;
  String image;
  Color colorBox;
  List<String> speciesLevel;
  String description;
  double price;

  TastyModel({
    required this.name,
    required this.image,
    required this.colorBox,
    required this.speciesLevel,
    required this.description,
    required this.price,
  });

  static List<TastyModel> getMainListCakes() {
    return [
      TastyModel(
        name: 'Chokolate cake',
        image: 'assets/images/cake_shoko.jpg',
        colorBox: const Color(0xffcff5cf),
        speciesLevel: ['without sugar', 'middle sugar', 'sugar tasty'],
        description: 'Шоколадный торт с насыщенным вкусом какао и мягкой текстурой. '
            'Идеален для любителей классических десертов.',
        price: 12.8,
      ),
      TastyModel(
        name: 'Limon cake',
        image: 'assets/images/cake_limon.jpg',
        colorBox: const Color(0xffcff5cf),
        speciesLevel: ['without sugar', 'middle sugar', 'sugar tasty'],
        description: 'Лёгкий лимонный торт с цитрусовым вкусом и воздушным кремом. '
            'Освежает и поднимает настроение.',
        price: 13.5,
      ),
      TastyModel(
        name: 'Chesse cake',
        image: 'assets/images/cake_cheese.jpg',
        colorBox: const Color(0xffcff5cf),
        speciesLevel: ['without sugar', 'middle sugar', 'sugar tasty'],
        description: 'Классический чизкейк с бархатистой начинкой из сливочного сыра '
            'и хрустящей основой. Лёгкий и насыщенный одновременно.',
        price: 16.2,
      ),
      TastyModel(
        name: 'Chokolate cake',
        image: 'assets/images/cake_shoko1.jpg',
        colorBox: const Color(0xffcff5cf),
        speciesLevel: ['without sugar', 'middle sugar', 'sugar tasty'],
        description: 'Вариант шоколадного торта с пониженным содержанием сахара. '
            'Сбалансированный вкус и аромат настоящего шоколада.',
        price: 10.8,
      ),
    ];
  }
}
