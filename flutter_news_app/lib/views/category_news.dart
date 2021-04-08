import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/data.dart';
import 'package:flutter_news_app/helper/news.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/models/categoryModel.dart';
import 'package:flutter_news_app/views/blog_tile.dart';
import 'package:flutter_news_app/views/category_Title.dart';

class Category extends StatefulWidget {
  String categoryName;

  Category({@required this.categoryName});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<CategorieModel> categories = [];
  List<ArticleModel> articels = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews categoryNews = CategoryNews();
    await categoryNews.getNews((widget.categoryName.toLowerCase()));
    articels = categoryNews.news;
    setState(() {
      _loading = false;
    });
    // print(articels[0].title);
  }

  @override
  Widget build(BuildContext context) {
    // print(articels);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Flutter",
                style: TextStyle(color: Colors.blue),
              ),
              Text("News")
            ],
          ),
          actions: [
            Icon(
              Icons.save,
              color: Colors.transparent,
            )
          ],
          elevation: 0.0,
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 70,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return CategoryTitle(
                                imageUrl: categories[index].imageAssetUrl,
                                categoryName: categories[index].categorieName,
                              );
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          widget.categoryName.toUpperCase().toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            // scrollDirection: Axis.vertical,
                            itemCount: articels.length,
                            itemBuilder: (context, index) {
                              return BlogTile(
                                imageUrl: articels[index].urlToImg,
                                title: articels[index].title,
                                desc: articels[index].desc,
                                url: articels[index].url,
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ));
  }
}
