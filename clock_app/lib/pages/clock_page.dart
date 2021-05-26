import 'package:clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timeZoneString = now.timeZoneOffset.toString().split('.').first;

    var offsetSign = '';

    if (!timeZoneString.startsWith('-')) {
      offsetSign = '+';
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 30),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              "Clock",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'avenir'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime.toString(),
                  style: TextStyle(
                      fontFamily: 'avenir', color: Colors.white, fontSize: 44),
                ),
                Text(
                  formattedDate.toString(),
                  style: TextStyle(
                      fontFamily: 'avenir', color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Align(
                alignment: Alignment.center,
                child: ClockView(
                  size: MediaQuery.of(context).size.height / 4,
                ),
              )),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Timezone",
                    style: TextStyle(
                        fontFamily: 'avenir',
                        color: Colors.white,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "UTC" + offsetSign + timeZoneString,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 1.5),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
