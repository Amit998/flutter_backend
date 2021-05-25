import 'package:clock_app/clock_view.dart';
import 'package:clock_app/constants/theme_data.dart';
import 'package:clock_app/enums.dart';
import 'package:clock_app/menu_info.dart';
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
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timeZoneString = now.timeZoneOffset.toString().split('.').first;

    var offsetSign = '';

    if (!timeZoneString.startsWith('-')) {
      offsetSign = '+';
    }

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
            if (value.menuType != MenuType.clock) return Container();
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
                              fontFamily: 'avenir',
                              color: Colors.white,
                              fontSize: 44),
                        ),
                        Text(
                          formattedDate.toString(),
                          style: TextStyle(
                              fontFamily: 'avenir',
                              color: Colors.white,
                              fontSize: 16),
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
              : Colors.transparent,
          onPressed: () {
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
