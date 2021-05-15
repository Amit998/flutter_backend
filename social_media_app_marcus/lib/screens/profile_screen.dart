import 'package:flutter/material.dart';
import 'package:social_media_app_marcus/data/data.dart';
import 'package:social_media_app_marcus/models/user_model.dart';
import 'package:social_media_app_marcus/widgets/custom_drawer.dart';
import 'package:social_media_app_marcus/widgets/post_carosel.dart';

import 'package:social_media_app_marcus/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PageController _yourPostsController;
  PageController _favoritePageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _yourPostsController =
        PageController(initialPage: 0, viewportFraction: 0.8);

    _favoritePageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: ProfileClipper(),
                child: Image(
                  height: 300,
                  width: double.infinity,
                  image: AssetImage(widget.user.backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () => _scafoldKey.currentState.openDrawer(),
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      )
                    ]),
                    child: ClipOval(
                      child: Image(
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                        image: AssetImage(currentUser.profileImageUrl),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            currentUser.name,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Following",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  Text(
                    currentUser.following.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    "Followers",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  Text(
                    currentUser.followers.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                ],
              )
            ],
          ),
          PostCarosel(
            pageController: _yourPostsController,
            title: "Your Posts",
            posts: widget.user.posts,
          ),
          SizedBox(
            height: 20,
          ),
          PostCarosel(
            pageController: _favoritePageController,
            title: "Faviourite",
            posts: widget.user.favorites,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
