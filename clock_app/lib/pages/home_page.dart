import 'package:clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timeZoneString = now.timeZoneOffset.toString().split('.').first;

    print(timeZoneString);

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Clock",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              "Clock",
              style: TextStyle(color: Colors.white, fontSize: 44),
            ),
            Text(
              "Clock",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            ClockView(),
            Text(
              "TimeZone",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Row(
              children: [
                Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "UTC",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
