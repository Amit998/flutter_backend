import 'package:http/http.dart' as http;
import 'data.dart';

class API_Services {
  getTrendingWallpaper() async {
    http.Response response;

    String url =
        "https://api.pexels.com/v1/search?query=coding&per_page=15&page=1";

    response =
        await http.get(Uri.parse(url), headers: {"Authorization": apiKey});

    print(response.body);
  }
}
