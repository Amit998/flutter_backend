import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rexora_project/pages/homepage/home.dart';

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
      theme: ThemeData(
          // fontFamily: GoogleFonts.mcLaren()

          ),
      home: HomePage(),
    );
  }
}
