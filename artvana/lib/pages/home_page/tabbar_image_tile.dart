import 'package:artvana/model/Image_Details.dart';
import 'package:artvana/pages/details_page.dart';
import 'package:flutter/material.dart';

class TabBarImageTile extends StatelessWidget {
  const TabBarImageTile({
    Key key,
    @required this.imageDetails,
  }) : super(key: key);

  final ImageDetails imageDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(imageDetails: imageDetails)));
      },
      child: Hero(
        tag: "${imageDetails.index}/Hero",
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(imageDetails.imagePath), fit: BoxFit.cover),
          ),
          child: Container(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(colors: [
            // Colors.purpleAccent.withOpacity(0.5),
            // Colors.purple.withOpacity(0.2),
            // Colors.deepPurple.withOpacity(0.1),
            // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                imageDetails.imageTitle,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TanBarHeading extends StatelessWidget {
  final String title;
  const TanBarHeading({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.purple,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {},
            child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 70,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purpleAccent),
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "More",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
