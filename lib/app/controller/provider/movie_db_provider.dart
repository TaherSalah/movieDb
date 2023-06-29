import 'package:flutter/cupertino.dart';
import 'package:movie_db_app/app/models/movie_db_model.dart';
import 'package:movie_db_app/app/services/movie_db_services.dart';

class MovieDbProvider extends ChangeNotifier {
  MovieDbServices movieDbServices = MovieDbServices();
  List<Results> movieList = [];
  bool isLoading = false;

  getMovieData() async {
    try {
      isLoading = true;
      notifyListeners();
      movieList = await movieDbServices.getMovieData();
      isLoading = false;
      notifyListeners();
    } on Exception catch (e) {
      Exception(e.toString());
      // TODO
    }
  }
}
