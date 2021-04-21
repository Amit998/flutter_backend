import 'package:flutter/material.dart';
import 'package:rexora_project/models/category_model.dart';
import 'package:rexora_project/pages/homepage/views/categoryTile.dart';


class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
    @required this.categoryList,
  }) : super(key: key);

  final List<CategorieModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: categoryList.length != null
          ? ListView.builder(
              itemCount: categoryList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryTile(
                    imgUrl: categoryList[index].imgUrl,
                    title: categoryList[index].categorieName);
              })
          : Container(),
    );
  }
}