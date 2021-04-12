import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';



class ImageView extends StatefulWidget {
  final String imgUrl;

  const ImageView({Key key, this.imgUrl}) : super(key: key);
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
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
                      print("object");
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

  // _save() async {
  //  var response = await Dio().get(
  //          "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
  //          options: Options(responseType: ResponseType.bytes));
  //  final result = await ImageGallerySaver.saveImage(
  //          Uint8List.fromList(response.data),
  //          quality: 60,
  //          name: "hello");
  //  print(result);
  // }
}
