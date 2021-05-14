import 'package:flutter/material.dart';
import 'package:social_media_app_marcus/data/data.dart';
import 'package:social_media_app_marcus/models/user_model.dart';
import 'package:social_media_app_marcus/screens/following_user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        centerTitle: true,
        title: Text(
          "FRENZT",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 12,
              color: Theme.of(context).primaryColor,
              fontSize: 22.0),
        ),
        bottom: TabBar(
          indicatorWeight: 3.0,
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
          unselectedLabelStyle: TextStyle(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              fontSize: 18.0),
          tabs: [
            Tab(
              text: "Trending",
            ),
            Tab(
              text: "Latest",
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          FollowingUsers(),
        ],
      ),
    );
  }
}
