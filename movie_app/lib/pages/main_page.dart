import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/controller/main_page_data_controller.dart';

import 'package:movie_app/model/main_page_data.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/search_category.dart';
import 'package:movie_app/widgets/movies_tile.dart';

final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageDataController>((ref) {
  return MainPageDataController();
});

final selectedMoviesURLProvider = StateProvider<String>((ref) {
  final _movies = ref.watch(mainPageDataControllerProvider.state).movies;

  return _movies.length != 0 ? _movies[0].posterUrl() : null;
});

class MainPage extends ConsumerWidget {
  double _deviceHeight;
  double _deviceWeight;

  var _selectedMoviePosterUrl;

  TextEditingController _searchTextEditingController;

  MainPageDataController _mainPageDataController;
  MainPageData _mainPageData;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWeight = MediaQuery.of(context).size.width;
    _mainPageDataController = watch(mainPageDataControllerProvider);
    _mainPageData = watch(mainPageDataControllerProvider.state);

    _selectedMoviePosterUrl = watch(selectedMoviesURLProvider);
    _searchTextEditingController = TextEditingController();
    _searchTextEditingController.text = _mainPageData.searchText;

    return _buildUi();
  }

  Widget _buildUi() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
          height: _deviceHeight,
          width: _deviceWeight,
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [_backgroundWidget(), _foregroundWidget()],
            ),
          )),
    );
  }

  Widget _backgroundWidget() {
    if (_selectedMoviePosterUrl.state != null) {
      return Container(
        height: _deviceHeight,
        width: _deviceWeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(
                  _selectedMoviePosterUrl.state,
                ),
                fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
          ),
        ),
      );
    } else {
      return Container(
        height: _deviceHeight,
        width: _deviceWeight,
        color: Colors.black,
      );
    }
  }

  Widget _foregroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.02, 0, 9),
      width: _deviceWeight * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
          Container(
            height: _deviceHeight * 0.83,
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
        value: _mainPageData.searchCategory,
        icon: Icon(
          Icons.menu,
          color: Colors.white24,
        ),
        underline: Container(
          height: 1,
          color: Colors.white24,
        ),
        onChanged: (_value) => _value.toString().isNotEmpty
            ? _mainPageDataController.updateSearchCategory(_value)
            : null,
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
        onSubmitted: (_input) =>
            _mainPageDataController.updateTextSearch(_input),
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
    final List<Movie> _movies = _mainPageData.movies;
    if (_movies.length != 0) {
      return NotificationListener(
          onNotification: (_onScrollNotification) {
            if (_onScrollNotification is ScrollEndNotification) {
              final before = _onScrollNotification.metrics.extentBefore;
              final max = _onScrollNotification.metrics.maxScrollExtent;
              if (before == max) {
                _mainPageDataController.getMovies();
                return true;
              } else {
                return false;
              }
            } else {
              return false;
            }
          },
          child: ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: _deviceHeight * 0.01, horizontal: 0),
                  child: GestureDetector(
                    onTap: () => _selectedMoviePosterUrl.state =
                        _movies[index].posterUrl(),
                    child: MoviesTile(
                      movie: _movies[index],
                      height: _deviceHeight * 0.20,
                      width: _deviceWeight * 0.85,
                    ),
                  ),
                );
              }));
    } else {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
