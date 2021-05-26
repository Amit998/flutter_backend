import 'package:clock_app/clock_view.dart';
import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/enums.dart';
import 'package:clock_app/menu_info.dart';
import 'package:clock_app/pages/alarm_page.dart';
import 'package:clock_app/pages/clock_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../data/data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // print(timeZoneString);

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map(
                      (currentMenuInfo) => buildFlatButtonIcon(currentMenuInfo))
                  .toList()),
          VerticalDivider(
            color: Colors.white,
            width: 1,
          ),
          Expanded(child: Consumer<MenuInfo>(builder: (context, value, child) {
            if (value.menuType == MenuType.clock)
              return ClockPage();
            else if (value.menuType == MenuType.alarm)
              return AlarmPage();
            else {
              return Container();
            }
          }))
        ],
      ),
    );
  }

  Widget buildFlatButtonIcon(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(builder: (context, value, child) {
      return FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          color: currentMenuInfo.menuType == value.menuType
              ? CustomColors.menuBackgroundColor
              // ? Colors.red
              : Colors.transparent,
          onPressed: () {
            print(value.menuType);
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: [
              Image.asset(
                currentMenuInfo.imageSource,
                scale: 1.5,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: 'avenir'),
              )
            ],
          ));
    });
  }
}
