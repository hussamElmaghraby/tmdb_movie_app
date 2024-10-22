import 'package:tmdb_movie_app/features/movies/domain/entities/movie_details_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movies_response_entity.dart';

abstract class MovieRepository {
  Future<MoviesResponseEntity> popularMovies();

  Future<MoviesResponseEntity> topRatedMovie();

  Future<MoviesResponseEntity> nowPlayingMovie();

  Future<MoviesResponseEntity> searchMovie();

  Future<MovieDetailsResponseEntity> getMovie({required int? movieId});
}
