import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/search_category.dart';
import 'package:movie_app/widgets/movies_tile.dart';

class MainPage extends ConsumerWidget {
  double _deviceHeight;
  double _deviceWeight;
  TextEditingController _searchTextEditingController;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWeight = MediaQuery.of(context).size.width;
    _searchTextEditingController = TextEditingController();

    return _buildUi();
  }

  Widget _buildUi() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: _deviceHeight,
        width: _deviceWeight,
        child: Stack(
          alignment: Alignment.center,
          children: [_backgroundWidget(), _foregroundWidget()],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
      height: _deviceHeight,
      width: _deviceWeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                'https://bingeddata.s3.amazonaws.com/uploads/2020/12/major-grom-plague-doctor-1.jpg',
              ),
              fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
        ),
      ),
    );
  }

  Widget _foregroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.02, 0, 9),
      width: _deviceHeight * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
          Container(
            height: _deviceWeight * 0.83,
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
            child: _movieListViewWidget(),
          )
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
      height: _deviceHeight * 0.08,
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_searchFiledWidget(), _categorySelectionWidget()],
      ),
    );
  }

  Widget _categorySelectionWidget() {
    return DropdownButton(
        dropdownColor: Colors.black38,
        value: SearchCategory.popular,
        icon: Icon(
          Icons.menu,
          color: Colors.white24,
        ),
        underline: Container(
          height: 1,
          color: Colors.white24,
        ),
        onChanged: (_value) {},
        items: [
          DropdownMenuItem(
              value: SearchCategory.none,
              child: Text(
                SearchCategory.none,
                style: TextStyle(color: Colors.white),
              )),
          DropdownMenuItem(
              value: SearchCategory.upcoming,
              child: Text(
                SearchCategory.upcoming,
                style: TextStyle(color: Colors.white),
              )),
          DropdownMenuItem(
              value: SearchCategory.popular,
              child: Text(
                SearchCategory.popular,
                style: TextStyle(color: Colors.white),
              )),
        ]);
  }

  Widget _searchFiledWidget() {
    final _border = InputBorder.none;
    return Container(
      width: _deviceWeight * 0.50,
      height: _deviceHeight * 0.05,
      child: TextField(
        controller: _searchTextEditingController,
        onSubmitted: (_input) {},
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            focusedBorder: _border,
            border: _border,
            hintStyle: TextStyle(color: Colors.white),
            filled: false,
            fillColor: Colors.white24,
            hintText: 'Search....',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            )),
      ),
    );
  }

  Widget _movieListViewWidget() {
    final List<Movie> _movies = [];

    for (var i = 0; i < 20; i++) {
      _movies.add(Movie(
          name: "Amit",
          language: "Eng",
          isAdult: false,
          description:
              "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
          posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
          backDropPath: "rr7E0NoGKxvbkb89eR1GwfoYjpA.jpg",
          rating: 7.8,
          releaseDate: "12-2-2020"));
    }

    if (_movies.length != 0) {
      return ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: _deviceHeight * 0.01, horizontal: 0),
              child: GestureDetector(
                onTap: () {},
                child: MoviesTile(
                  movie: _movies[index],
                  height: _deviceHeight * 0.2,
                  width: _deviceWeight * 0.85,
                ),
              ),
            );
          });
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
