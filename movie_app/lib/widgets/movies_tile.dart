import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/model/movie.dart';

class MoviesTile extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;
  final double height;
  final double width;
  final Movie movie;

  MoviesTile({Key key, this.height, this.width, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _moviewPosterWidget(movie.posterUrl()),
          _movieInfoWidget(),
        ],
      ),
    );
  }

  Widget _moviewPosterWidget(String _posterUrl) {
    return Container(
      height: height,
      width: width * 0.35,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(_posterUrl), fit: BoxFit.cover)),
    );
  }

  Widget _movieInfoWidget() {
    return Container(
      height: height,
      width: width * 0.66,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.56,
                child: Text(
                  movie.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                movie.rating.toString(),
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: height * 0.02),
            child: Text(
              "${movie.language.toUpperCase()} R: ${movie.isAdult} Date ${movie.releaseDate} ",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: height * 0.07),
            child: Text(
              movie.description,
              style: TextStyle(color: Colors.white, fontSize: 10),
              maxLines: 9,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
