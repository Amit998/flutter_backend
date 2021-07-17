import 'package:artvana/model/Image_Details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icons.arrow_back_ios,
                      ),
                      CustomIconButton(
                        onPressed: () {},
                        icon: FontAwesomeIcons.download,
                      ),
                    ],
                  )
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
                          'By Bratati Banerjee ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Text(
                        //   'Price ${imageDetails.imagePrice.toString()} RS ',
                        //   style: TextStyle(
                        //       color: Colors.lightBlueAccent,
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w600),
                        // ),
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
                      RoundButtonWithoutIcon(
                        title: "Buy",
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RoundButtonWithIcon(
                        title: "Like",
                        icon: FontAwesomeIcons.heartbeat,
                      ),
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

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  const CustomIconButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 50, left: 20),
          child: Icon(
            icon,
            color: Colors.white,
            size: 40,
          )),
    );
  }
}

class RoundButtonWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const RoundButtonWithIcon({Key key, @required this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 40,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                color: Colors.red,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )),
    ));
  }
}

class RoundButtonWithoutIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const RoundButtonWithoutIcon({Key key, @required this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 40,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )),
    ));
  }
}
