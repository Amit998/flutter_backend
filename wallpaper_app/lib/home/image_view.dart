import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;

  const ImageView({Key key, this.imgUrl}) : super(key: key);
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl,
            child: Image.network(
              widget.imgUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // print("object");
                      _save();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white60, width: 1),
                          gradient: LinearGradient(colors: [
                            // Color(0x36FFFFFF).withOpacity(0.6),
                            // Colors.black,
                            Colors.black.withOpacity(0.6),
                            Color(0x0FFFFFFF).withOpacity(0.6),
                          ]),
                          // color: Colors.transparent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(40)),
                      child: Column(
                        children: [
                          Text(
                            "Set Wallpaper",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          Text(
                            "Image Will Be Saved In Your Gallery",
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.7)
                                    // fontWeight: FontWeight.bold
                                    ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.transparent.withOpacity(0.6)),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _save() async {
    if (Platform.isAndroid) {
      await _askPermission();
    }
    var response = await Dio()
        .get(widget.imgUrl, options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      /*Map<PermissionGroup, PermissionStatus> permissions =
          */
      await PermissionHandler().requestPermissions([PermissionGroup.photos]);
    } else {
      /* PermissionStatus permission = */ await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }
}
