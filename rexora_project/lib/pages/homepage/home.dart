import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
        title: Padding(padding: EdgeInsets.only(right: 00), child: BrandName()),
        backgroundColor: Colors.white,
        elevation: 0.1,
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
