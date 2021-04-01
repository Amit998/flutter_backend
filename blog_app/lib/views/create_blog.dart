import 'dart:io';
import 'package:intl/intl.dart';
import 'package:blog_app/services/curd.dart';
import 'package:blog_app/widgets/appBar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc;
  bool _isloading = false;
  DateTime now;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadBlog() async {
    now = DateTime.now();
    if (_image != null) {
      setState(() {
        _isloading = true;
      });
      StorageReference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("blogImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask task = firebaseStorageRef.putFile(_image);

      var downloadUrl = await (await task.onComplete).ref.getDownloadURL();

      Map<String, dynamic> blogMap = {
        "imgUrl": downloadUrl,
        "authorName": authorName,
        "title": title,
        "description": desc,
        "upload_date": now
      };
      curdModel.addData(blogMap).then((value) {
        Navigator.pop(context);
      });

      setState(() {
        _isloading = false;
      });

      // print("This Is download Url ${downloadUrl}");
    }
  }

  CURDModel curdModel = new CURDModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(notMainPage: true),
      body: _isloading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Divider(),
                    GestureDetector(
                      onTap: getImage,
                      child: _image == null
                          ? Container(
                              // padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.90,
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.greenAccent,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(5.0, 0.0),
                                      blurRadius: 20.0,
                                      spreadRadius: 2.0)
                                ],
                              ),
                              padding: EdgeInsets.all(20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.file(
                                  _image,
                                  fit: BoxFit.cover,
                                ),
                              )),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          TextField(
                            decoration:
                                InputDecoration(hintText: "Author Name"),
                            onChanged: (val) {
                              authorName = val;
                            },
                          ),
                          Divider(),
                          TextField(
                            decoration: InputDecoration(hintText: "Title"),
                            onChanged: (val) {
                              title = val;
                            },
                          ),
                          Divider(),
                          TextField(
                            decoration:
                                InputDecoration(hintText: "Description"),
                            onChanged: (val) {
                              desc = val;
                            },
                          ),
                          Divider(),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.greenAccent,
                            ),
                            child: TextButton(
                                onPressed: uploadBlog,
                                child: Text(
                                  "Upload",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
