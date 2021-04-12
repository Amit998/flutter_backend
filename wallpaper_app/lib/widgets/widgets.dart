import 'package:flutter/material.dart';
import 'package:wallpaper_app/home/image_view.dart';
import 'package:wallpaper_app/model/wallpaperModel.dart';

Widget BrandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue),
      )
    ],
  );
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  // print(wallpapers.length);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: GridView.count(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: wallpapers.map((wallpaper) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageView(
                    imgUrl: wallpaper.src.original,
                  )));
            },
            child: Hero(
              tag: wallpaper.src.original,
              child: Container(
                // child: Text("Hi"),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      wallpaper.src.portrait,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ));
        }).toList()),
  );
}
