import 'package:bloc/bloc.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movie_details_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movies_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tmdb_movie_app/features/movies/domain/usecases/search_movies_usecase.dart';
import 'package:tmdb_movie_app/inits/injector.dart';

import 'movies_events.dart';
import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetTopRatedMoviesUsecase _getTopRatedMoviesUsecase =
      getIt<GetTopRatedMoviesUsecase>();
  final GetPopularMoviesUsecase _getPopularMoviesUsecase =
      getIt<GetPopularMoviesUsecase>();
  final GetSearchMoviesUsecase _getSearchMoviesUsecase =
      getIt<GetSearchMoviesUsecase>();

  final GetNowPlayingMoviesUsecase _getNowPlayingMoviesUsecase =
      getIt<GetNowPlayingMoviesUsecase>();
  final GetMovieDetailsUsecase _getMovieDetailsUsecase =
      getIt<GetMovieDetailsUsecase>();

  MoviesBloc()
      : super(
          MoviesInitState(),
        ) {
    // top rates movies
    on<GetTopRatedEvent>(
      (event, emit) async {
        emit(MoviesLoadingState());
        try {
          final MoviesResponseEntity moviesResponseEntity =
              await _getTopRatedMoviesUsecase();
          emit(
            MoviesSuccessState(
              moviesResponseEntity: moviesResponseEntity,
            ),
          );
        } catch (e) {
          emit(MoviesErrorState(error: e));
        }
      },
    );

    // popular movies
    on<GetPopularEvent>(
      (event, emit) async {
        emit(MoviesLoadingState());
        try {
          final MoviesResponseEntity moviesResponseEntity =
              await _getPopularMoviesUsecase();
          emit(
            MoviesSuccessState(
              moviesResponseEntity: moviesResponseEntity,
            ),
          );
        } catch (e) {
          emit(MoviesErrorState(error: e));
        }
      },
    );

    // now playing movies
    on<GetNowPlayingEvent>(
      (event, emit) async {
        emit(MoviesLoadingState());
        try {
          final MoviesResponseEntity moviesResponseEntity =
              await _getNowPlayingMoviesUsecase();
          emit(
            MoviesSuccessState(
              moviesResponseEntity: moviesResponseEntity,
            ),
          );
        } catch (e) {
          emit(MoviesErrorState(error: e));
        }
      },
    );

    // search movies
    on<GetSearchMoviesEvent>(
      (event, emit) async {
        emit(MoviesLoadingState());
        try {
          final MoviesResponseEntity moviesResponseEntity =
              await _getSearchMoviesUsecase();
          emit(
            MoviesSuccessState(
              moviesResponseEntity: moviesResponseEntity,
            ),
          );
        } catch (e) {
          emit(MoviesErrorState(error: e));
        }
      },
    );

    // search movies
    on<GetMovieDetailsEvent>(
      (event, emit) async {
        emit(MoviesLoadingState());
        try {
          final MovieDetailsResponseEntity movieDetailsResponseEntity =
              await _getMovieDetailsUsecase(movieId: event.movieId);
          emit(
            MovieDetailsSuccessState(
              movieDetailsResponseEntity: movieDetailsResponseEntity,
            ),
          );
        } catch (e) {
          emit(MoviesErrorState(error: e));
        }
      },
    );
  }
}
