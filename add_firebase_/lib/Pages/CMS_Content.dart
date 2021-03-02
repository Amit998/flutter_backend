import 'package:add_firebase_/Pages/CMS_body.dart';
import 'package:add_firebase_/variables.dart';
import 'package:flutter/material.dart';

class CmsContent extends StatefulWidget {
  @override
  _CmsContentState createState() => _CmsContentState();
}

class _CmsContentState extends State<CmsContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   Container(
        //       margin: EdgeInsets.all(10),
        //       child: IconButton(
        //         onPressed: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (contect) => CmsContent()));
        //         },
        //         icon: Icon(
        //           Icons.folder,
        //         ),
        //       ))
        // ],
        elevation: 0,
      ),
      body: Body(),
    );
  }
}
