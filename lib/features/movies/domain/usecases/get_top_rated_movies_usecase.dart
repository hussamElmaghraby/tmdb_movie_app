import 'package:injectable/injectable.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movies_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/repository/movies_repository.dart';

@injectable
class GetTopRatedMoviesUsecase {
  final MovieRepository _movieRepository;

  GetTopRatedMoviesUsecase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;


  Future<MoviesResponseEntity> call() async => _movieRepository.topRatedMovie();
}
