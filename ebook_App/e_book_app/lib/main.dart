import 'package:e_book_app/view/bottom_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sizer',
        theme: ThemeData.light(),
        home: BottomView(),
      );
    });
  }
}


// MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'E Book App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BottomView(),
//     );

// Sizer(
//       builder: (context, orientation, deviceType) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Sizer',
//           theme: ThemeData.light(),
//           home: HomeScreen() ,
//         );
//       },
//     );