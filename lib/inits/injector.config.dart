// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:tmdb_movie_app/common/modules/dio_module.dart' as _i1071;
import 'package:tmdb_movie_app/common/singletons/dio_singleton.dart' as _i208;
import 'package:tmdb_movie_app/common/storage/shared_data_service.dart'
    as _i121;
import 'package:tmdb_movie_app/features/movies/data/datasource/movies_datasource.dart'
    as _i1006;
import 'package:tmdb_movie_app/features/movies/data/repo_impl/movies_repo_impl.dart'
    as _i339;
import 'package:tmdb_movie_app/features/movies/domain/repository/movies_repository.dart'
    as _i559;
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_movie_details_usecase.dart'
    as _i159;
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_now_playing_movies_usecase.dart'
    as _i753;
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_popular_movies_usecase.dart'
    as _i100;
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_top_rated_movies_usecase.dart'
    as _i417;
import 'package:tmdb_movie_app/features/movies/domain/usecases/search_movies_usecase.dart'
    as _i566;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factoryAsync<_i460.SharedPreferences>(() => registerModule.prefs);
    gh.singleton<_i208.DioService>(() => _i208.DioService());
    gh.singleton<_i121.SharedDataService>(() => _i121.SharedDataServiceImp());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i361.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i1006.MoviesDatasource>(
        () => _i1006.MoviesDatasource(gh<_i361.Dio>()));
    gh.factory<_i559.MovieRepository>(() =>
        _i339.MovieRepoImpl(moviesDatasource: gh<_i1006.MoviesDatasource>()));
    gh.factory<_i417.GetTopRatedMoviesUsecase>(() =>
        _i417.GetTopRatedMoviesUsecase(
            movieRepository: gh<_i559.MovieRepository>()));
    gh.factory<_i100.GetPopularMoviesUsecase>(() =>
        _i100.GetPopularMoviesUsecase(
            movieRepository: gh<_i559.MovieRepository>()));
    gh.factory<_i753.GetNowPlayingMoviesUsecase>(() =>
        _i753.GetNowPlayingMoviesUsecase(
            movieRepository: gh<_i559.MovieRepository>()));
    gh.factory<_i566.GetSearchMoviesUsecase>(() => _i566.GetSearchMoviesUsecase(
        movieRepository: gh<_i559.MovieRepository>()));
    gh.factory<_i159.GetMovieDetailsUsecase>(() => _i159.GetMovieDetailsUsecase(
        movieRepository: gh<_i559.MovieRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i1071.RegisterModule {}
