import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/data.dart';
import 'package:flutter_news_app/helper/news.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/models/categoryModel.dart';
import 'package:flutter_news_app/views/article_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categories = [];
  List<ArticleModel> articels = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    articels = news.news;
    setState(() {
      _loading = false;
      // articels = news.news;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(categories);
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
                padding: EdgeInsets.symmetric(horizontal: 16),
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
                    // SizedBox(
                    // height: 10,
                    // ),
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
            ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final String imageUrl, categoryName;

  const CategoryTitle({Key key, this.imageUrl, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                width: 120,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  categoryName.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  const BlogTile(
      {Key key,
      @required this.url,
      @required this.imageUrl,
      @required this.title,
      @required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(url: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl)),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              desc,
              style: TextStyle(color: Colors.black38),
            ),
          ],
        ),
      ),
    );
  }
}
