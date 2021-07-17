import 'package:artvana/model/Image_Details.dart';
import 'package:artvana/pages/home_page/tabbar_image_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TabBarImages extends StatelessWidget {
  const TabBarImages({
    Key key,
    @required List<ImageDetails> this.images,
  }) : super(key: key);

  final List<ImageDetails> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: images.length,
          crossAxisCount: 4,
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 8.0,
          itemBuilder: (BuildContext context, int index) {
            ImageDetails imageDetails = images[index];
            imageDetails.index = index;

            return TabBarImageTile(imageDetails: imageDetails);
          }),
    );
  }
}
