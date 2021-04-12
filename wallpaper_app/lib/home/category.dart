import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/wallpaperModel.dart';
import 'package:wallpaper_app/widgets/widgets.dart';

class CategoryList extends StatefulWidget {
  final String CategorieName;

  const CategoryList({Key key, this.CategorieName}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<WallpaperModel> wallpapers = [];

  getSearchedCategory(String query) async {
    http.Response response;

    String url =
        "https://api.pexels.com/v1/search?query=$query&per_page=16&page=1";

    response =
        await http.get(Uri.parse(url), headers: {"Authorization": apiKey});

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((ele) {
      // print(ele);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(ele);

      wallpapers.add(wallpaperModel);

      // print(wallpaperModel);
    });
    // print(wallpapers[2].src.original);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getSearchedCategory(widget.CategorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.1,
        centerTitle: true,
        title: BrandName(),
      ),
      body: SingleChildScrollView(
        child: wallpapersList(wallpapers: wallpapers, context: context),
      ),
    );
  }
}
