import 'package:e_book_app/view/bottom_favorite.dart';
import 'package:e_book_app/view/bottom_library.dart';
import 'package:e_book_app/view/bottom_profile.dart';
import 'package:e_book_app/view/home.dart';
import 'package:flutter/material.dart';

class BottomView extends StatefulWidget {
  const BottomView({Key? key}) : super(key: key);

  @override
  _BottomViewState createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  int currentIndex = 0;
  List<Widget> body = [
    Home(),
    Bottom_Library(),
    Bottom_Profile(),
    Bottom_Favorite(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.black,
          onTap: onTabBottomView,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_books), label: 'Library'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
          ],
        ),
      ),
    );
  }

  void onTabBottomView(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
