import 'package:clock_app/enums.dart';
import 'package:clock_app/menu_info.dart';
import 'package:clock_app/pages/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    // FlutterLocalNotificationsPlugin();

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // var initializationSettingsAndroid =
  //     AndroidInitializationSettings("avengers.png");

  // var initalizationSettingsIOS = IOSInitializationSettings(
  //   requestAlertPermission: true,
  //   requestBadgePermission: true,
  //   requestSoundPermission: true,
  //   onDidReceiveLocalNotification:
  //       (int id, String title, String body, String payload) async {},
  // );

  // var initializationSettings = InitializationSettings(
  //     initializationSettingsAndroid, initalizationSettingsIOS);
  // await flutterLocalNotificationsPlugin.initialize(
  //   initializationSettings,
  //   onSelectNotification: (String payload) async {
  //     if (payload != null) {
  //       debugPrint("notification payload");
  //     }
  //   },
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(MenuType.clock), child: MyHomePage()),
    );
  }
}
