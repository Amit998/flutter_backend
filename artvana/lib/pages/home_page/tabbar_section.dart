import 'package:artvana/model/Image_Details.dart';
import 'package:artvana/pages/home_page/tabbar_image.dart';
import 'package:artvana/pages/home_page/tabbar_image_tile.dart';
import 'package:flutter/material.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({Key key, @required this.images, @required this.title});

  final String title;

  final List<ImageDetails> images;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TanBarHeading(title: title),
          TabBarImages(images: images),
        ],
      ),
    );
  }
}
