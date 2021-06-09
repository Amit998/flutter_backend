import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/const/theme_data.dart';
import 'package:store_app/provider/dark_theme_provider.dart';
import 'package:store_app/screens/bottom_bar.dart';
import 'package:store_app/screens/user_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangedProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangedProvider.darkTheme =
        await themeChangedProvider.darkThemPreferences.getTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangedProvider;
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangedProvider.darkTheme, context),
            home: BottomBar(),
          );
        }));
  }
}
