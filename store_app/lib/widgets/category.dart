import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final int index;
  CategoryWidget(this.index);
  List<Map<String, Object>> _categories = [
    {
      'categoryName': 'Phones',
      'categoryImagePath': 'assets/images/CatPhones.png',
    },
    {
      'categoryName': 'Beauty',
      'categoryImagePath': 'assets/images/CatBeauty.jpg',
    },
    {
      'categoryName': 'Shoes',
      'categoryImagePath': 'assets/images/CatShoes.jpg',
    },
    {
      'categoryName': 'BeutyHealth',
      'categoryImagePath': 'assets/images/CatBeauty.jpg',
    },
    {
      'categoryName': 'Laptops',
      'categoryImagePath': 'assets/images/CatLaptops.png',
    },
    {
      'categoryName': 'Furniture',
      'categoryImagePath': 'assets/images/CatClothes.jpg',
    },
    {
      'categoryName': 'Watches',
      'categoryImagePath': 'assets/images/CatWatches.jpg',
    },
    {
      'categoryName': 'Clothes',
      'categoryImagePath': 'assets/images/CatClothes.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(_categories[index]['categoryImagePath']),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                color: Theme.of(context).backgroundColor,
                child: Text(
                  _categories[index]['categoryName'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).textSelectionColor),
                ))),
      ],
    );
  }
}
