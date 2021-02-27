import 'package:brew_crew_app/models/brew.dart';
import 'package:brew_crew_app/screens/home/brew_list.dart';
import 'package:brew_crew_app/screens/home/setting_form.dart';
import 'package:brew_crew_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text(
                "log out",
                style: (TextStyle(color: Colors.white)),
              ),
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            FlatButton.icon(
              onPressed: () => _showSettingPanel(),
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              label: Text(
                'Settings',
                style: (TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
              ),
              
            ),
            child: BrewList()),
      ),
    );
  }
}
