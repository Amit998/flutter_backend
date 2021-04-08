import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  String categoryName;

  Category({@required this.categoryName});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
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
          Container(
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.save,
                  color: Colors.blue,
                )),
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
        child: Text(widget.categoryName.toString()),
      ),
    );
  }
}
