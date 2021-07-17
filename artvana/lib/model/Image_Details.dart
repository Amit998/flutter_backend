import 'package:flutter/cupertino.dart';

class ImageDetails {
  final String imagePath;
  final double imagePrice;
  final String imageArtist;
  final String imageCaption;
  final String imageCategory;
  final String imageTitle;
  final String imageDetails;
  int index;

  ImageDetails(
      {@required this.imagePath,
      @required this.imageArtist,
      @required this.imageCategory,
      @required this.imagePrice,
      @required this.imageCaption,
      @required this.imageTitle,
      @required this.imageDetails,
      this.index
      });
}
