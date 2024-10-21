import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:tmdb_movie_app/common/urls_constants/apis_constants.dart';
import 'package:tmdb_movie_app/features/movies/data/models/movie/movie_details_response_model.dart';
import 'package:tmdb_movie_app/features/movies/data/models/movies/movies_response_model.dart';

part 'movies_datasource.g.dart';

@injectable
@RestApi(baseUrl: Apis.baseUrl)
abstract class MoviesDatasource {
  @factoryMethod
  factory MoviesDatasource(Dio dio) = _MoviesDatasource;

  @GET(Apis.popularMovie)
  Future<MoviesResponseModel> popularMovies();

  @GET(Apis.topRatedMovie)
  Future<MoviesResponseModel> topRatedMovie();

  @GET(Apis.nowPlayingMovie)
  Future<MoviesResponseModel> nowPlayingMovie();

  @GET(Apis.nowPlayingMovie)
  Future<MoviesResponseModel> searchMovie();

  @GET('${Apis.movieId}{movie_id}')
  Future<MovieDetailsResponseModel> getMovie(@Path('movie_id') String movieId);
}
