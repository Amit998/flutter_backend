import 'package:flutter/material.dart';
import 'package:rest_api_1/models/news_info.dart';
import 'package:rest_api_1/services/api_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: Container(
          child: FutureBuilder<NewsModel>(
        future: _newsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data.articles[index];
                  return Container(
                    height: 100,
                    child: Row(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              article.urlToImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            padding: EdgeInsets.all(4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(article.description.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
