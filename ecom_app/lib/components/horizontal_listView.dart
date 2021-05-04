import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(() {
            print("object");
          }, imageCaption: "Shirt", imageLocation: "images/cats/tshirt.png"),
          Category(() {},
              imageCaption: "Accessories",
              imageLocation: "images/cats/accessories.png"),
          Category(() {},
              imageCaption: "Dress", imageLocation: "images/cats/dress.png"),
          Category(() {},
              imageCaption: "Formal", imageLocation: "images/cats/formal.png"),
          Category(() {},
              imageCaption: "Informal",
              imageLocation: "images/cats/informal.png"),
          Category(() {},
              imageCaption: "Jeans", imageLocation: "images/cats/jeans.png"),
          Category(() {},
              imageCaption: "Shoe", imageLocation: "images/cats/shoe.png"),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  final press;

  Category(this.press, {this.imageCaption = "", this.imageLocation = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: press,
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              height: 80,
              width: 100,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter, child: Text(imageCaption)),
          ),
        ),
      ),
    );
  }
}
