import 'package:flutter/cupertino.dart';

class WallpaperModel {
  String photographer;
  String photographer_url;
  int photographer_id;
  String avg_color;
  SrcModel src;

  WallpaperModel(
      {this.photographer,
      this.photographer_url,
      this.photographer_id,
      this.avg_color,
      this.src});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        src: SrcModel.fromMap(jsonData["src"]),
        photographer: jsonData["photographer"],
        photographer_url: jsonData["photographer_url"],
        photographer_id: jsonData["photographer_id"],
        avg_color: jsonData["avg_color"]);
  }
}

class SrcModel {
  String original;
  String small;
  String tiny;
  String portrait;
  String landscape;

  SrcModel(
      {this.original, this.small, this.tiny, this.portrait, this.landscape});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        portrait: jsonData["portrait"],
        original: jsonData["original"],
        small: jsonData["small"],
        tiny: jsonData["tiny"],
        landscape: jsonData["landscape"]);
  }
}
