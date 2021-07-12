import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/http_services.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  HTTPService _http;

  MovieService() {
    _http = getIt.get<HTTPService>();
  }

  Future<List<Movie>> getPopularMovies({int page}) async {
    Response _response = await _http.get('/movie/popular', {'page': page});

    if (_response.statusCode == 200) {
      Map _data = _response.data;
      List<Movie> _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();

      return _movies;
    } else {
      throw Exception('Couldn\'t load movies');
    }
  }

  Future<List<Movie>> getUpcomingMovies({int page}) async {
    Response _response = await _http.get('/movie/upcoming', {'page': page});

    if (_response.statusCode == 200) {
      Map _data = _response.data;
      List<Movie> _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();

      return _movies;
    } else {
      throw Exception('Couldn\'t upcoming movies');
    }
  }

  Future<List<Movie>> searchMovies(String _searchText, {int page}) async {
    Response _response =
        await _http.get('/search/movie', {'query': _searchText, 'page': page});

    if (_response.statusCode == 200) {
      Map _data = _response.data;
      List<Movie> _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();

      return _movies;
    } else {
      throw Exception('Couldn\'t perform movie search');
    }
  }
}
