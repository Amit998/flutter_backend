import 'package:artvana/model/Image_Details.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final ImageDetails imageDetails;

  const DetailsPage({Key key, @required this.imageDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Hero(
              tag: "${imageDetails.index}/Hero",
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        image: DecorationImage(
                            image: AssetImage(imageDetails.imagePath),
                            fit: BoxFit.cover)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 50, left: 20),
                        child: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                          size: 40,
                        )),
                  ),
                ],
              ),
            )),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          imageDetails.imageTitle,
                          style: TextStyle(
                              letterSpacing: 1.2,
                              color: Colors.lightBlue,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'By ${imageDetails.imageTitle.toString()} ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Price ${imageDetails.imagePrice.toString()} RS ',
                          style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' ${imageDetails.imageDetails.toString()} RS ',
                          style: TextStyle(
                              letterSpacing: 1.2,
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: FlatButton(
                        onPressed: () {},
                        color: Colors.blueAccent,
                        child: Text(
                          "Buy",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: FlatButton(
                              onPressed: () {},
                              color: Colors.blueAccent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.linked_camera,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    "Like",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
