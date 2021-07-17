import 'package:artvana/data/image_data.dart';
import 'package:artvana/model/Image_Details.dart';
import 'package:artvana/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const KTitleTextStyle =
    TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold);

const KSmallTextStyle = TextStyle(
    color: Colors.purpleAccent, fontSize: 18, fontWeight: FontWeight.bold);

const KLargeTextStyle =
    TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold);

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  List<ImageDetails> _images = [];

  @override
  void initState() {
    _images = images;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/user.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Bratati Banerjee",
                style: KTitleTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "UI/UX Designer",
                style: KSmallTextStyle,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    icon: FontAwesomeIcons.linkedin,
                    containerColor: Colors.blue,
                    iconColor: Colors.purple,
                    link: "",
                  ),
                  SocialButton(
                    icon: FontAwesomeIcons.instagram,
                    containerColor: Colors.purpleAccent,
                    iconColor: Colors.purple,
                    link: "",
                  ),
                  SocialButton(
                    icon: FontAwesomeIcons.github,
                    containerColor: Colors.black,
                    iconColor: Colors.grey,
                    link: "",
                  ),
                  SocialButton(
                    icon: FontAwesomeIcons.facebook,
                    containerColor: Colors.blueAccent,
                    iconColor: Colors.white,
                    link: "",
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PostFollower(
                    number: 100,
                    text: 'Posts',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  PostFollower(
                    number: 1000,
                    text: 'Likes',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  PostFollower(
                    number: 200,
                    text: 'Followers',
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: RawMaterialButton(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 2,
                                    color: Color.fromRGBO(30, 65, 255, 1))),
                            child: Center(
                              child: Text(
                                "Messages",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          onPressed: () {})),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: RawMaterialButton(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(30, 65, 255, 1),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 2,
                                    color: Color.fromRGBO(30, 65, 255, 1))),
                            child: Center(
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          onPressed: () {}))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: [
                    GalleryImage(
                      imagePath: "assets/images/1.jpg",
                    ),
                    GalleryImage(
                      imagePath: "assets/images/2.jpg",
                    ),
                    GalleryImage(
                      imagePath: "assets/images/3.jpg",
                    ),
                    GalleryImage(
                      imagePath: "assets/images/4.jpg",
                    ),
                    GalleryImage(
                      imagePath: "assets/images/5.jpg",
                    ),
                    GalleryImage(
                      imagePath: "assets/images/6.jpg",
                    ),
                    GalleryImage(
                      imagePath: "assets/images/7.jpg",
                    ),
                    GalleryImage(
                      imagePath: "assets/images/8.jpg",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class GalleryImage extends StatelessWidget {
  final String imagePath;
  const GalleryImage({
    Key key,
    @required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
    );
  }
}

class PostFollower extends StatelessWidget {
  final int number;
  final String text;
  const PostFollower({
    Key key,
    @required this.number,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: KLargeTextStyle,
        ),
        Text(
          text.toString(),
          style: KSmallTextStyle,
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String link;
  final Color iconColor, containerColor;

  const SocialButton({
    Key key,
    @required this.icon,
    @required this.link,
    @required this.iconColor,
    @required this.containerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: containerColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20)),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
