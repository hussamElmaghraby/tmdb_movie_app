import 'package:injectable/injectable.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movie_details_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/repository/movies_repository.dart';


@injectable
class GetMovieDetailsUsecase {
  final MovieRepository _movieRepository;

  GetMovieDetailsUsecase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  Future<MovieDetailsResponseEntity> call({required int? movieId}) async =>
      _movieRepository.getMovie(movieId: movieId);
}
