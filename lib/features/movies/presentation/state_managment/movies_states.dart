import 'package:tmdb_movie_app/features/movies/domain/entities/movie_details_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movies_response_entity.dart';

class MoviesState {}

class MoviesInitState extends MoviesState {}

class MoviesSuccessState extends MoviesState {
  final MoviesResponseEntity moviesResponseEntity;

  MoviesSuccessState({required this.moviesResponseEntity});
}

class MovieDetailsSuccessState extends MoviesState {
  final MovieDetailsResponseEntity movieDetailsResponseEntity;

  MovieDetailsSuccessState({
    required this.movieDetailsResponseEntity,
  });
}

class MoviesLoadingState extends MoviesState {}

class MoviesErrorState extends MoviesState {
  final dynamic error;

  MoviesErrorState({required this.error});
}
