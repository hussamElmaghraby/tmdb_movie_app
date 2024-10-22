import 'package:bloc/bloc.dart';
import 'package:tmdb_movie_app/features/movies/presentation/state_managment/movies_states.dart';

class MoviesEvent {}



class GetTopRatedEvent  extends MoviesEvent {}

class GetPopularEvent  extends MoviesEvent {}


class GetNowPlayingEvent  extends MoviesEvent {}


class GetSearchMoviesEvent  extends MoviesEvent {}

class GetMovieDetailsEvent  extends MoviesEvent {
  final int? movieId;

  GetMovieDetailsEvent({required this.movieId});
}