import 'package:flutter/material.dart';
import 'package:integration_rest_api_product_list/pages/my_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // primarySwatch: Colors.white12,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        title: 'Flutter Demo',
        home: MyHomePage());
  }
}
