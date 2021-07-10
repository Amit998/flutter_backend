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
        ],
      ),
    );
  }

  Widget _moviewPosterWidget(String _posterUrl) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(_posterUrl), fit: BoxFit.cover)),
    );
  }
}
