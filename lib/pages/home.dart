import 'package:wasabi_delisious/models/drinkModel.dart';
import 'package:wasabi_delisious/models/pizzaModel.dart';
import 'package:wasabi_delisious/models/sushiModel.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/tastyModel.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CategoryModel> categoryData = CategoryModel.getCategories();
  final List<TastyModel> mData = TastyModel.getMainListCakes();
  final List<DrinkModel> mData1 = DrinkModel.getMainListDrinks();
  final List<PizzaModel> mData2 = PizzaModel.getMainListPizzas();
  List<SushiModel> sushiData = SushiModel.getMainListSushi();
  List<Object> main_list = [];
  List<Object> all_items = [];
  List<Object> filtered_list = [];
  int selectedCategoryIndex = 0;

  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    all_items = [...sushiData, ...mData1, ...mData, ...mData2];
    updateMainList();
  }

  void updateMainList() {
    if (searchQuery.isNotEmpty) {
      return;
    }

    switch (selectedCategoryIndex) {
      case 0:
        main_list = sushiData;
        break;
      case 1:
        main_list = mData1;
        break;
      case 2:
        main_list = mData;
        break;
      case 3:
        main_list = mData2;
        break;
      default:
        main_list = mData;
        break;
    }
    filterItems();
  }

  void filterItems() {
    if (searchQuery.isEmpty) {
      filtered_list = main_list;
    } else {
      // Ищем по всем элементам, а не только по текущей категории
      filtered_list =
          all_items.where((item) {
            // Получаем название элемента
            String itemName = '';
            String itemDescription = '';

            if (item is SushiModel) {
              itemName = item.name.toLowerCase();
              if (item.speciesLevel.length > 1) {
                itemDescription = item.speciesLevel[1].toLowerCase();
              }
            } else if (item is DrinkModel) {
              itemName = item.name.toLowerCase();
              if (item.speciesLevel.length > 1) {
                itemDescription = item.speciesLevel[1].toLowerCase();
              }
            } else if (item is TastyModel) {
              itemName = item.name.toLowerCase();
              if (item.speciesLevel.length > 1) {
                itemDescription = item.speciesLevel[1].toLowerCase();
              }
            } else if (item is PizzaModel) {
              itemName = item.name.toLowerCase();
              if (item.speciesLevel.length > 1) {
                itemDescription = item.speciesLevel[1].toLowerCase();
              }
            }

            String query = searchQuery.toLowerCase();
            return itemName.contains(query) || itemDescription.contains(query);
          }).toList();
    }
    setState(() {});
  }

  void onSearchChanged(String query) {
    searchQuery = query;
    filterItems();
  }

  void clearSearch() {
    searchController.clear();
    searchQuery = '';
    filterItems();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1200,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [header(), categories(), Snack()],
          ),
        ),
      ),
    );
  }

  Container header() {
    return Container(
      height: 320,
      color: const Color(0xff9af3f3),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Wasabi Sushi',
                style: TextStyle(fontSize: 18, color: Color(0xFF290ECA)),
              ),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(48.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/burgericon11.png'),
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Welcome\nto Wasabi Sushi',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26,
              color: Color(0xff070000),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Search here..',
              hintStyle: const TextStyle(fontWeight: FontWeight.w300),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ),
              suffixIcon:
              searchQuery.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.black54),
                onPressed: clearSearch,
              )
                  : null,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 94,
          margin: const EdgeInsets.all(16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  for (var item in categoryData) {
                    item.isSelected = false;
                  }
                  categoryData[index].isSelected = true;
                  selectedCategoryIndex = index;
                  updateMainList();
                  setState(() {});
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color:
                        categoryData[index].isSelected
                            ? const Color(0xff84e38c).withOpacity(0.9)
                            : const Color(0xff2f4f73).withOpacity(0.22),
                        offset: const Offset(0, 4),
                        blurRadius: 35,
                      ), // BoxShadow
                    ],
                    color:
                    categoryData[index].isSelected
                        ? const Color(0xff84e38c)
                        : Colors.white,
                  ),
                  child: Image(
                    image: AssetImage(categoryData[index].vector),
                    height: 40,
                    width: 40,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 45),
            itemCount: categoryData.length,
          ),
        ),
      ],
    );
  }

  Widget Snack() {
    // Показываем сообщение, если ничего не найдено
    if (filtered_list.isEmpty && searchQuery.isNotEmpty) {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
              const SizedBox(height: 16),
              Text(
                'Ничего не найдено',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Попробуйте изменить запрос',
                style: TextStyle(fontSize: 14, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemBuilder: (context, index) {
          dynamic snackModel = filtered_list[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => DetailPage(snackModel: filtered_list[index]),
                ),
              );
            },
            child: Container(
              height: 109,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff2f4f73).withOpacity(0.22),
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 105,
                    decoration: BoxDecoration(
                      color: snackModel.colorBox,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage(snackModel.image),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snackModel.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          snackModel.speciesLevel[1],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/priceRedSmolliconLabe.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              snackModel.price.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: filtered_list.length,
      ),
    );
  }
}
