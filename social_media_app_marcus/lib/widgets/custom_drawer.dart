import 'package:flutter/material.dart';
import 'package:social_media_app_marcus/data/data.dart';
import 'package:social_media_app_marcus/screens/Home_screen.dart';
import 'package:social_media_app_marcus/screens/login_screens.dart';
import 'package:social_media_app_marcus/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          // color: Colors.blue.withOpacity(0.8)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                // top: 20,
                bottom: 20,
                left: 20,
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor)),
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(
                              currentUser.profileImageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )
                  ],
                ),
              )
            ],
          ),
          _buildDrawerOption(
              Icon(
                Icons.dashboard,
                color: Theme.of(context).primaryColor,
              ),
              "Home", () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }),
          Divider(),
          _buildDrawerOption(
              Icon(
                Icons.chat,
                color: Theme.of(context).primaryColor,
              ),
              "Chat",
              () {}),
          Divider(),
          _buildDrawerOption(
              Icon(
                Icons.map,
                color: Colors.greenAccent,
              ),
              "Map",
              () {}),
          Divider(),
          _buildDrawerOption(
              Icon(
                Icons.account_circle,
                // color: Colors.greenAccent,
              ),
              "Your Profile", () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                          user: currentUser,
                        )));
          }),
          Divider(),
          _buildDrawerOption(
              Icon(
                Icons.settings,
                color: Colors.blueGrey,
              ),
              "Settings",
              () {}),
          Divider(),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: _buildDrawerOption(
                Icon(
                  Icons.directions_run,
                  color: Colors.red,
                ),
                "Logout", () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            }),
          )),
        ],
      ),
    );
  }
}
