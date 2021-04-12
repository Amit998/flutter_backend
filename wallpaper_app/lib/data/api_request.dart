// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:wallpaper_app/model/wallpaperModel.dart';
// import 'data.dart';

// class API_Services {
//   getTrendingWallpaper() async {
//     List<WallpaperModel> wallpapers = new List();

//     http.Response response;

//     String url =
//         "https://api.pexels.com/v1/search?query=coding&per_page=15&page=1";

//     response =
//         await http.get(Uri.parse(url), headers: {"Authorization": apiKey});

//     // print(response.statusCode);

//     Map<String, dynamic> jsonData = jsonDecode(response.body);

//     // print(jsonData.length);

//     jsonData["photos"].forEach((ele) {
//       print(ele);
//       WallpaperModel wallpaperModel = new WallpaperModel();
//       wallpaperModel = WallpaperModel.fromMap(jsonData);

//       wallpapers.add(wallpaperModel);

//       // print(wallpaperModel);
//     });
//     // print(jsonData);

//     return ['wallpapers'];
//   }
// }
