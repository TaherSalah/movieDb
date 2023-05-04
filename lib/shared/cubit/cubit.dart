import 'package:dio/dio.dart%20';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/shared/cubit/states.dart';


import '../../models/details_model.dart';
import '../../models/movie_model.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/movies/movies_screen.dart';
import '../../screens/person/person_screen.dart';
import '../../screens/trending/trending_screen.dart';
import '../../screens/tv/tv_screen.dart';
import '../componts/constance.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieInitialState());

  static BlocProvider get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    TrendingScreen(),
    const TvScreen(),
    const MovieScreen(),
    const PepoleScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(BottomNavBarNewsState());
  }

///// start get Trending data ////
  List<MovieModels> trendingResults = [];

  Future<List<MovieModels>> fetchTrendingData() async {
    try {
      emit(GetTrendingLoadingState());
      Response response =
          await Dio().get('$baseUrl/trending/all/day?api_key=$apiKey');
      for (var item in response.data['results']) {
        trendingResults.add(MovieModels.fromJson(item));
        emit(GetTrendingSuccessState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetTrendingErrorState(e.toString()));
    }
    return trendingResults;
  }

///// End get Trending data ////
///// Start get movie popular data ////
  List<MovieModels> popularResults = [];

  Future<List<MovieModels>> fetchPopular() async {
    try {
      emit(GetPopularLoadingState());
      Response response =
          await Dio().get('$baseUrl/movie/popular?api_key=$apiKey');
      for (var item in response.data['results']) {
        popularResults.add(MovieModels.fromJson(item));
        emit(GetPopularSuccessState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetPopularErrorState(e.toString()));
    }
    return popularResults;
  }

///// End get movie popular data ////
///// Start get movie Top Rated data ////
  List<MovieModels> topRatedResults = [];

  Future<List<MovieModels>> fetchTopRated() async {
    try {
      emit(GetTopRatedLoadingState());
      Response response =
          await Dio().get('$baseUrl/movie/top_rated?api_key=$apiKey');
      for (var item in response.data['results']) {
        topRatedResults.add(MovieModels.fromJson(item));
        emit(GetTopRatedSuccessState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetTopRatedErrorState(e.toString()));
    }
    return topRatedResults;
  }

///// End get movie Top Rated data ////
///// Start get movie upcoming data ////
  List<MovieModels> upcomingResults = [];

  Future<List<MovieModels>> fetchUpcoming() async {
    try {
      emit(GetUpComingLoadingState());
      Response response =
          await Dio().get('$baseUrl/movie/upcoming?api_key=$apiKey');
      for (var item in response.data['results']) {
        upcomingResults.add(MovieModels.fromJson(item));
        emit(GetUpComingSuccessState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetUpComingErrorState(e.toString()));
    }
    return upcomingResults;
  }

///// End get movie Top Rated data ////

///// Start get movie Now Playing data ////
  List<MovieModels> nowPlayingResults = [];

  Future<List<MovieModels>> fetchNowPlaying() async {
    try {
      emit(GetNowPlayingLoadingState());
      Response response =
          await Dio().get('$baseUrl/movie/now_playing?api_key=$apiKey');
      for (var item in response.data['results']) {
        nowPlayingResults.add(MovieModels.fromJson(item));
        emit(GetNowPlayingSuccessState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetNowPlayingErrorState(e.toString()));
    }
    return nowPlayingResults;
  }

///// End get movie Now Playing data ////
// /// Start get movie Person data ////
  List<MovieModels> personResults = [];

  Future<List<MovieModels>> fetchPerson() async {
    try {
      emit(GetMoviePersonLoadingState());
      Response response =
          await Dio().get('$baseUrl/person/popular?api_key=$apiKey');
      for (var item in response.data['results']) {
        personResults.add(MovieModels.fromJson(item));
        emit(GetMoviePersonSuccessState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetMoviePersonErrorState(e.toString()));
    }
    return personResults;
  }

///// End get movie Person data ////

// / Start get movie Person data ////
  List<DetailsMovieModels> detailsResults = [];

  Future<List<DetailsMovieModels>> fetchDetails(int id) async {
    try {
      emit(GetMovieDetailsLoadingState());
      Response response = await Dio().get('$baseUrl/movie/$id?api_key=$apiKey');
      for (var item in response.data['results']) {
        detailsResults.add(DetailsMovieModels.fromJson(item));
        emit(GetMovieDetailsSuccessState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetMovieDetailsErrorState(e.toString()));
    }
    return detailsResults;
  }

// / End get movie Person data ////

///// Start get  AiringTv data ////
  List<MovieModels> airingTvResults = [];

  Future<List<MovieModels>> fetchAiringTv() async {
    try {
      emit(GetTvAiringTodayLoadingState());
      Response response =
          await Dio().get('$baseUrl/tv/airing_today?api_key=$apiKey');
      for (var item in response.data['results']) {
        airingTvResults.add(MovieModels.fromJson(item));
        emit(GetTvAiringTodaySuccessState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetTvAiringTodayErrorState(e.toString()));
    }
    return airingTvResults;
  }

///// End get movie AiringTv data ////
// /// Start get Tv data ////
  List<MovieModels> TvResults = [];

  Future<List<MovieModels>> fetchTv() async {
    try {
      emit(GetTvLoadingState());
      Response response =
          await Dio().get('$baseUrl/tv/top_rated?api_key=$apiKey');
      for (var item in response.data['results']) {
        TvResults.add(MovieModels.fromJson(item));
        emit(GetTvSuccessState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetTvErrorState(e.toString()));
    }
    return TvResults;
  }

///// End get movie AiringTv data ////
}
