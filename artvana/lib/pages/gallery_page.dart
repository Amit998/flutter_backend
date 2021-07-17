import 'package:artvana/data/image_data.dart';
import 'package:artvana/model/Image_Details.dart';
import 'package:artvana/pages/details_page.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<ImageDetails> _images = [];

  @override
  void initState() {
    _images = images;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Header(),
            SizedBox(height: 40),
            GallerySection(),
          ],
        ),
      ),
    );
  }

  Widget Header() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Artvana",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 34, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget GallerySection() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: GridView.builder(
            itemCount: _images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 5),
            itemBuilder: (BuildContext context, int index) {
              ImageDetails imageDetails = _images[index];
              imageDetails.index = index;
              return RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(imageDetails: imageDetails)));
                },
                child: Hero(
                  tag: "${imageDetails.index}/Hero",
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(_images[index].imagePath))),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
