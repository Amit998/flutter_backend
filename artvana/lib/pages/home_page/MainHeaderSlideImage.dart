import 'package:artvana/model/Image_Details.dart';
import 'package:flutter/material.dart';

class MainHeaderSlideImage extends StatelessWidget {
  ImageDetails imageDetails;

  MainHeaderSlideImage({
    Key key,
    @required this.imageDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 20),
      child: AspectRatio(
        aspectRatio: 1.25 / 2,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage("${imageDetails.imagePath}"),
                  fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0),
                ], begin: Alignment.bottomRight, end: Alignment.topRight)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${imageDetails.imageTitle}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                // Text(
                //   " RS ${imageDetails.imagePrice.toString()} ",
                //   style: TextStyle(
                //       color: Color.fromRGBO(255, 100, 150, 1),
                //       fontSize: 16,
                //       fontWeight: FontWeight.w600),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
