import 'package:get_it/get_it.dart';
import 'package:movie_app/model/app_config.dart';

class Movie {
  final String name;
  final String language;
  final bool isAdult;
  final String description;
  final String posterPath;
  final String backDropPath;
  final String releaseDate;
  final num rating;

  Movie(
      {this.name,
      this.language,
      this.isAdult,
      this.description,
      this.posterPath,
      this.backDropPath,
      this.releaseDate,
      this.rating});

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      name: _json['title'],
      language: _json['original language'],
      isAdult: _json['adult'],
      description: _json['overview'],
      posterPath: _json['poster_path'],
      backDropPath: _json['backdrop_path'],
      rating: _json['vote_average'],
      releaseDate: _json['release_date'],
    );
  }

  String posterUrl() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();

    return '${_appConfig.BASE_IMAGE_API_URL}${this.posterPath}';
  }
}
