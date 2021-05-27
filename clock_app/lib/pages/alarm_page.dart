import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/data/data.dart';
import 'package:clock_app/models/alarm_info.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Alarm",
            style: TextStyle(
                fontFamily: 'avenir',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: CustomColors.primaryTextColor),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: alarms.map<Widget>((alarm) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  // height: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: alarm.gradientColors.last.withOpacity(0.4),
                          blurRadius: 8,
                          offset: Offset(4, 4),
                          spreadRadius: 2)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: alarm.gradientColors),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Office",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'avenir'),
                              ),
                            ],
                          ),
                          Switch(value: true, onChanged: (bool value) {})
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mon-Fri",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'avenir'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "07:00 AM",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'avenir',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 32,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).followedBy([
                DottedBorder(
                  strokeWidth: 3,
                  color: CustomColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(26),
                  dashPattern: [5, 4],
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    height: 120,
                    decoration: BoxDecoration(
                        color: CustomColors.clockBG,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        FlatButton(
                          onPressed: () {
                            // scheduleAlarm();
                          },
                          child: Image.asset(
                            "assets/add_alarm.png",
                            scale: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Add Alarm",
                            style: TextStyle(
                                color: Colors.white, fontFamily: "avenir"))
                      ],
                    ),
                  ),
                ),
              ]).toList(),
            ),
          )
        ],
      ),
    );
  }

  void scheduleAlarm(
      DateTime scheduledNotificationDateTime, AlarmInfo alarmInfo) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'avengers',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Office',
        alarmInfo.description,
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }
  // void onSaveAlarm() {
  //   DateTime scheduleAlarmDateTime;
  //   if (_alarmTime.isAfter(DateTime.now()))
  //     scheduleAlarmDateTime = _alarmTime;
  //   else
  //     scheduleAlarmDateTime = _alarmTime.add(Duration(days: 1));

  //   var alarmInfo = AlarmInfo(
  //     alarmDateTime: scheduleAlarmDateTime,
  //     gradientColorIndex: _currentAlarms.length,
  //     title: 'alarm',
  //   );
  //   _alarmHelper.insertAlarm(alarmInfo);
  //   scheduleAlarm(scheduleAlarmDateTime, alarmInfo);
  //   Navigator.pop(context);
  //   loadAlarms();
  // }

  // void deleteAlarm(int id) {
  //   _alarmHelper.delete(id);
  //   //unsubscribe for notification
  //   loadAlarms();
  // }

}
