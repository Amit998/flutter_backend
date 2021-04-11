import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wallpaper_app/data/api_request.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/category_model.dart';
import 'package:wallpaper_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategorieModel> categorieList = [];

  @override
  void initState() {
    API_Services api_services = new API_Services();
    api_services.getTrendingWallpaper();

    categorieList = getCategories();
    // print(categorieList[0].imgUrl);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: BrandName(),
        elevation: 0.1,
      ),
      body: Container(
        // margin: EdgeInsets.symmetric(horizontal: 24),
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
                      decoration: InputDecoration(
                          hintText: "Search", border: InputBorder.none),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categorieList.length,
                  itemBuilder: (context, index) {
                    return CategorieTile(
                        name: categorieList[index].categorieName,
                        imageUrl: categorieList[index].imgUrl);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CategorieTile extends StatelessWidget {
  String name;
  String imageUrl;
  CategorieTile({@required this.name, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      // height: 200,
      // width: 200,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 100,
              width: 150,
            ),
          ),
          Container(
              color: Colors.black38.withOpacity(0.2),
              height: 100,
              width: 150,
              alignment: Alignment.center,
              child: Text(
                name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ))
        ],
      ),
    );
  }
}
