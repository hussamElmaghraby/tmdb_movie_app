import 'package:injectable/injectable.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movies_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/repository/movies_repository.dart';

@injectable
class GetPopularMoviesUsecase {
  final MovieRepository _movieRepository;

  GetPopularMoviesUsecase({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;


  Future<MoviesResponseEntity> call() async => _movieRepository.popularMovies();
}
