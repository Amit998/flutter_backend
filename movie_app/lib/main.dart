import 'package:flutter/material.dart';
import 'package:movie_app/pages/main_page.dart';
import 'package:movie_app/pages/splashScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MySplashScreen(
    onInitializationComplete: () => runApp(
      ProviderScope(child: MyApp()),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flick",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext _context) => MainPage(),
      },
    );
  }
}
