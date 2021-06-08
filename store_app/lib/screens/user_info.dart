import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _value = false;

  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: _userTitle("User Title")),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            userListView("Email", "Email@gmail.com", 0, context),
            userListView("Phone", "587656757", 1, context),
            userListView("Shipping Address", "Katwa", 2, context),
            userListView("Joined Date", "(12/2/2021)", 3, context),
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: _userTitle("User Settings")),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTileSwitch(
              value: _value,
              leading: Icon(Ionicons.md_moon),
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              visualDensity: VisualDensity.comfortable,
              switchType: SwitchType.cupertino,
              switchActiveColor: Colors.indigo,
              title: Text('Dark Theme'),
            ),
            userListView("logout", "", 4, context),
          ],
        ),
      ),
    );
  }

  Widget userListView(
      String title, String subtitle, int index, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        splashColor: Theme.of(context).primaryColor,
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(_userTileIcons[index]),
        ),
      ),
    );
  }

  Widget _userTitle(String title) {
    return Text(
      "User Info",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}
