import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rexora_project/data/category_data.dart';
import 'package:rexora_project/models/category_model.dart';
import 'package:rexora_project/pages/homepage/body.dart';
import 'package:rexora_project/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        // leading: FontAwesomeIcons.addressBook,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                color: Colors.black,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(FontAwesomeIcons.bars));
          },
        ),
        title: Padding(padding: EdgeInsets.only(right: 00), child: BrandName()),
        backgroundColor: Colors.white,
        elevation: 0.1,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit))],
      ),
      body: Body(),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(child: Text("Text")),
      //     ],
      //   ),
      // ),
    );
  }
}
