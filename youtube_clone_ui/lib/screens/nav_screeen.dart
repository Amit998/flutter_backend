import 'package:flutter/material.dart';
import 'package:youtube_clone_ui/screens/home_screen.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text("Explore"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Add"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Subcription"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Libery"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map(
              (i, screen) => MapEntry(
                  i,
                  Offstage(
                    offstage: _selectedIndex != i,
                    child: screen,
                  )),
            )
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: "Explore",
              activeIcon: Icon(Icons.explore_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: "Add",
              activeIcon: Icon(Icons.add_circle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: "Home",
              activeIcon: Icon(Icons.subscriptions_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              label: "Home",
              activeIcon: Icon(Icons.video_library)),
        ],
      ),
    );
  }
}
