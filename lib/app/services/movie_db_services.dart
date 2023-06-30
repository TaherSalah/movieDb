import 'package:dio/dio.dart';
import 'package:movie_db_app/app/models/movie_db_model.dart';

import '../shard/constanc/url.dart';

class MovieDbServices {
  static final Dio dio = Dio();
    getMovieData(String movieType,String types) async {
    try {
      final responce = await dio.get('https://api.themoviedb.org/3/$movieType/$types?$apiKey');
      if (responce.statusCode == 200) {
        MovieModel movieModel   = MovieModel.fromJson(responce.data);
        return movieModel.results;
      }
      else{
        throw Exception('error');
      }
    } on Exception catch (e) {
      //TODO :-

      print('errrrrrrror to fetch data ${e.toString()}');
    }
  }
}
