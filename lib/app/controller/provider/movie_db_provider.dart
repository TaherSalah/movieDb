import 'package:flutter/cupertino.dart';
import 'package:movie_db_app/app/models/movie_db_model.dart';
import 'package:movie_db_app/app/services/movie_db_services.dart';

class MovieDbProvider extends ChangeNotifier {
  MovieDbServices movieDbServices = MovieDbServices();
  List<Results> movieList = [];
  List<Results> tvList = [];
  List<Results> nowPlayingList = [];
  bool isLoading = false;

  getMovieData() async {
    try {
      isLoading = true;
      notifyListeners();
      movieList = await movieDbServices.getMovieData('movie');
      isLoading = false;
      notifyListeners();
    } on Exception catch (e) {
      Exception(e.toString());
      // TODO
    }
  }
  getTvData() async {
    try {
      isLoading = true;
      notifyListeners();
      tvList = await movieDbServices.getMovieData('tv');
      isLoading = false;
      notifyListeners();
    } on Exception catch (e) {
      Exception(e.toString());
      // TODO
    }
  }
  getNowPlayingData() async {
    try {
      isLoading = true;
      notifyListeners();
      nowPlayingList = await movieDbServices.getMovieData('now_playing');
      isLoading = false;
      notifyListeners();
    } on Exception catch (e) {
      Exception(e.toString());
      // TODO
    }
  }
}
