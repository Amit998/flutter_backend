import 'package:artvana/pages/bottom_bar.dart';
import 'package:artvana/pages/gallery_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: 'Sen'),
        home: BottomBar());
  }
}
