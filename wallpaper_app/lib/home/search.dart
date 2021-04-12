import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/wallpaperModel.dart';
import 'package:wallpaper_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;

  const Search({Key key, this.searchQuery}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textEditingController = new TextEditingController();
  List<WallpaperModel> wallpapers = [];

  @override
  void initState() {
    getSearchedWallpaper(widget.searchQuery);
    super.initState();
    textEditingController.text = widget.searchQuery;
  }

  getSearchedWallpaper(String query) async {
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
  Widget build(BuildContext context) {
    print(widget.searchQuery);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.1,
        centerTitle: true,
        title: BrandName(),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    color: Color(0xffff5f8fd),
                    borderRadius: BorderRadius.circular(16)
                    //  shape: Border
                    ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                            hintText: "Search", border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          getSearchedWallpaper(textEditingController.text);
                        },
                        icon: Icon(Icons.search))
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
