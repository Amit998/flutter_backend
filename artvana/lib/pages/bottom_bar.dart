import 'package:artvana/pages/gallery_page.dart';
import 'package:artvana/pages/home_page.dart';
import 'package:artvana/pages/profile_details.dart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Map<String, Object>> _page;
  int _selectedPage = 0;

  @override
  void initState() {
    _page = [
      {
        'page': HomePage(),
      },
      {
        'page': GalleryPage(),
      },
      {
        'page': ProfileDetails(),
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
          height: MediaQuery.of(context).size.height * 0.08,
          child: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Colors.black,
            unselectedItemColor: Theme.of(context).textSelectionColor,
            selectedItemColor: Colors.purple,
            currentIndex: _selectedPage,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.home), title: Text("Home")),
              BottomNavigationBarItem(icon: Icon(null), title: Text("Gallery")),
              BottomNavigationBarItem(
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/images/user.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text("Profile")),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(5),
        child: FloatingActionButton(
          hoverElevation: 19,
          backgroundColor: Colors.purple,
          tooltip: 'Gallery',
          splashColor: Colors.blueGrey,
          elevation: 4,
          child: Icon(FontAwesomeIcons.images),
          onPressed: () {
            setState(() {
              _selectPage(1);
            });
          },
        ),
      ),
    );
  }
}
