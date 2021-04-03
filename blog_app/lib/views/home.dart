import 'package:blog_app/services/curd.dart';
import 'package:blog_app/views/create_blog.dart';
import 'package:blog_app/widgets/appBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CURDModel curdModel = new CURDModel();
  // QuerySnapshot blogSnapshot;
  Stream blogsStream;

  @override
  void initState() {
    // TODO: implement initState

    curdModel.getData().then((result) {
      // print(result);

      setState(() {
        blogsStream = result;
      });
      super.initState();
      // print(blogSnapshot.documents.length);
      // setState(() {
      //   blogSnapshot = result;
      // });
      // print(blogSnapshot.documents.length);
      // print(result['authorName']);
    });
  }

  // Widget blogList() {
  //   // print(blogSnapshot);
  //   return Container(
  //     child: Column(children: [
  //       blogSnapshot != null
  //           ? ListView.builder(
  //               padding: EdgeInsets.all(2),
  //               shrinkWrap: true,
  //               // itemCount: 0,
  //               itemCount: blogSnapshot.documents.length,
  //               itemBuilder: (context, index) {
  //                 return BlogTile(
  //                   authorName:blogSnapshot.documents[index].data["authorName"],
  //                   title: blogSnapshot.documents[index].data["title"],
  //                   imgUrl: blogSnapshot.documents[index].data["imgUrl"],
  //                   date: blogSnapshot.documents[index].data["upload_date"],
  //                   desc: blogSnapshot.documents[index].data["description"],
  //                 );
  //               })
  //           : Container(
  //               alignment: Alignment.center,
  //               child: Center(child: CircularProgressIndicator()))
  //     ]),
  //   );
  // }
  //
  //
  Widget blogList() {
    // print(blogsStream != null);
    // print(blogSnapshot);
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          blogsStream != null
              ? StreamBuilder(
                  // print(blogsStream != null);
                  stream: blogsStream,
                  builder: (context, snapshot) {
                    return snapshot.data != null
                        ? ListView.builder(
                            padding: EdgeInsets.all(2),
                            shrinkWrap: true,
                            // itemCount: 0,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              return snapshot.data != null
                                  ? BlogTile(
                                      authorName: snapshot.data.documents[index]
                                          .data["authorName"],
                                      title: snapshot
                                          .data.documents[index].data["title"],
                                      imgUrl: snapshot
                                          .data.documents[index].data["imgUrl"],
                                      date: snapshot.data.documents[index]
                                          .data["upload_date"],
                                      desc: snapshot.data.documents[index]
                                          .data["description"],
                                    )
                                  : Container();
                            })
                        : Container();
                  })
              : Container(
                  alignment: Alignment.center,
                  child: Center(child: CircularProgressIndicator()))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(notMainPage: false),
      body: blogList(),
      floatingActionButton: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.add,
                size: 36,
                color: Colors.greenAccent,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateBlog()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  String imgUrl, desc, authorName, title;
  dynamic date;
  BlogTile(
      {@required this.imgUrl,
      @required this.desc,
      @required this.authorName,
      @required this.date,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, right: 10, left: 10),
      height: 150,
      child: Stack(
        children: [
          // Positioned(child: Text("Data")),

          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black45.withOpacity(0.3),
            ),
          ),
          Stack(
            children: [
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    "21-03-2021",
                    style: TextStyle(fontSize: 13),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title == 'no_title' ? " " : title,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      desc == 'no_description' ? " " : desc,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      authorName,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                    // Positioned(bottom: 0, right: 0, child: Text("Data"))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
