import 'dart:io';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String header = "LOL";
  String footer = "LOL";

  File _image;
  File _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.asset("assets/maxresdefault.jpg"),
              SizedBox(
                height: 12,
              ),
              Image.asset(
                "assets/5cwx89t4-1389586191.png",
              ),
              Stack(
                children: [
                  _image != null
                      ? Image.file(
                          _image,
                          height: 300,
                        )
                      : Container(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Text(header),
                        Spacer(),
                        Text(footer),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    setState(() {
                      header = val;
                    });
                  }
                },
                decoration: InputDecoration(hintText: "Header text"),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    setState(() {
                      header = val;
                    });
                  }
                },
                decoration: InputDecoration(hintText: "Footer text"),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
