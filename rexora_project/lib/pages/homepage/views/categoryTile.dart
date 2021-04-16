import 'package:flutter/material.dart';


class CategoryTile extends StatelessWidget {
  String imgUrl, title;

  CategoryTile({@required this.imgUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Text(title.toString()),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              // padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width - 40,
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );
  }
}
