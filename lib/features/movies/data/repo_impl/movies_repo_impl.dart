import 'package:injectable/injectable.dart';
import 'package:tmdb_movie_app/features/movies/data/datasource/movies_datasource.dart';
import 'package:tmdb_movie_app/features/movies/data/models/movie/movie_details_response_model.dart';
import 'package:tmdb_movie_app/features/movies/data/models/movies/movies_response_model.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movie_details_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movies_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/repository/movies_repository.dart';


@Injectable(as: MovieRepository )
class MovieRepoImpl extends MovieRepository {
final MoviesDatasource _moviesDatasource;

  MovieRepoImpl({required MoviesDatasource moviesDatasource}) : _moviesDatasource = moviesDatasource;

  @override
  Future<MovieDetailsResponseEntity> getMovie({required int? movieId})async {
    final MovieDetailsResponseModel response  = await _moviesDatasource.getMovie(movieId);
    return response.toEntity();
  }

  @override
  Future<MoviesResponseEntity> nowPlayingMovie() async{
    final MoviesResponseModel response  = await _moviesDatasource.nowPlayingMovie();
    return response.toEntity();
  }

  @override
  Future<MoviesResponseEntity> popularMovies() async {
   final MoviesResponseModel response  = await _moviesDatasource.popularMovies();
   return response.toEntity();
  }

  @override
  Future<MoviesResponseEntity> searchMovie() {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }

  @override
  Future<MoviesResponseEntity> topRatedMovie()async {
    final MoviesResponseModel response  = await _moviesDatasource.topRatedMovie();
    return response.toEntity();
  }
}