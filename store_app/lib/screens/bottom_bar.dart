import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:store_app/const/my_icons.dart';
import 'package:store_app/screens/cart.dart';
import 'package:store_app/screens/feed.dart';
import 'package:store_app/screens/home.dart';
import 'package:store_app/screens/search.dart';
import 'package:store_app/screens/user_info.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Map<String, Object>> _page;
  int _selectedPage = 1;

  @override
  void initState() {
    _page = [
      {
        'page': HomePage(),
      },
      {
        'page': Feeds(),
      },
      {
        'page': Search(),
      },
      {
        'page': Cart(),
      },
      {
        'page': UserInfo(),
      },
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedPage]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(top: BorderSide(color: Colors.grey, width: 0.5))),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.purple,
              currentIndex: _selectedPage,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(MyAppIcons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(MyAppIcons.rss), title: Text("Feed")),
                BottomNavigationBarItem(
                    icon: Icon(null), title: Text("Search")),
                BottomNavigationBarItem(
                    icon: Icon(MyAppIcons.bag), title: Text("Cart")),
                BottomNavigationBarItem(
                    icon: Icon(MyAppIcons.user), title: Text("User")),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          hoverElevation: 19,
          backgroundColor: Colors.purple,
          tooltip: 'Search',
          splashColor: Colors.grey,
          elevation: 4,
          child: Icon(MyAppIcons.search),
          onPressed: () {
            setState(() {
              _selectedPage = 2;
            });
          },
        ),
      ),
    );
  }
}
