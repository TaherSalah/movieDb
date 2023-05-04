
import '../../models/movie_model.dart';

abstract class MovieStates {}

class BottomNavBarNewsState extends MovieStates {}

class MovieInitialState extends MovieStates {}

class MovieLoadingState extends MovieStates {}

class MovieSuccessState extends MovieStates {
  List<MovieModels> movie = [];

  MovieSuccessState(this.movie);
}

class MovieErrorState extends MovieStates {}
/////// start  Trending  state ////////

class GetTrendingLoadingState extends MovieStates {}

class GetTrendingSuccessState extends MovieStates {}

class GetTrendingErrorState extends MovieStates {
  final String error;

  GetTrendingErrorState(this.error);
}
/////// End  Trending  state ////////

/////// start  movie popular  state ////////
class GetPopularLoadingState extends MovieStates {}

class GetPopularSuccessState extends MovieStates {}

class GetPopularErrorState extends MovieStates {
  final String error;

  GetPopularErrorState(this.error);
}

/////// End  movie popular  state ////////
/////// start  movie TopRated  state ////////
class GetTopRatedLoadingState extends MovieStates {}

class GetTopRatedSuccessState extends MovieStates {}

class GetTopRatedErrorState extends MovieStates {
  final String error;

  GetTopRatedErrorState(this.error);
}

/////// End  movie TopRated  state ////////
/////// start  movie UpComing  state ////////
class GetUpComingLoadingState extends MovieStates {}

class GetUpComingSuccessState extends MovieStates {}

class GetUpComingErrorState extends MovieStates {
  final String error;

  GetUpComingErrorState(this.error);
}

/////// End  movie UpComing  state ////////

/////// start  movie now_playing  state ////////
class GetNowPlayingLoadingState extends MovieStates {}

class GetNowPlayingSuccessState extends MovieStates {}

class GetNowPlayingErrorState extends MovieStates {
  final String error;

  GetNowPlayingErrorState(this.error);
}

/////// End  movie now_playing  state ////////
/////// start  movie Person  state ////////
class GetMoviePersonLoadingState extends MovieStates {}

class GetMoviePersonSuccessState extends MovieStates {}

class GetMoviePersonErrorState extends MovieStates {
  final String error;

  GetMoviePersonErrorState(this.error);
}

/////// End  movie Person  state ///////

// ////// start  movie Details  state ////////
class GetMovieDetailsLoadingState extends MovieStates {}

class GetMovieDetailsSuccessState extends MovieStates {}

class GetMovieDetailsErrorState extends MovieStates {
  final String error;

  GetMovieDetailsErrorState(this.error);
}

/////// End  movie Details  state ////////

/////// start  Tv airing_today  state ////////
class GetTvAiringTodayLoadingState extends MovieStates {}

class GetTvAiringTodaySuccessState extends MovieStates {}

class GetTvAiringTodayErrorState extends MovieStates {
  final String error;

  GetTvAiringTodayErrorState(this.error);
}

/////// End  Tv airing_today  state ////////
// ///// start  Tv airing_today  state ////////
class GetTvLoadingState extends MovieStates {}

class GetTvSuccessState extends MovieStates {}

class GetTvErrorState extends MovieStates {
  final String error;

  GetTvErrorState(this.error);
}

/////// End  Tv airing_today  state ////////
