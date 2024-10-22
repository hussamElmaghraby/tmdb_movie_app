// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;
import 'package:tmdb_movie_app/common/modules/dio_module.dart' as _i15;
import 'package:tmdb_movie_app/common/singletons/dio_singleton.dart' as _i4;
import 'package:tmdb_movie_app/common/storage/shared_data_service.dart' as _i5;
import 'package:tmdb_movie_app/features/movies/data/datasource/movies_datasource.dart'
    as _i7;
import 'package:tmdb_movie_app/features/movies/data/repo_impl/movies_repo_impl.dart'
    as _i9;
import 'package:tmdb_movie_app/features/movies/domain/repository/movies_repository.dart'
    as _i8;
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_movie_details_usecase.dart'
    as _i10;
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_now_playing_movies_usecase.dart'
    as _i11;
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_popular_movies_usecase.dart'
    as _i12;
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_top_rated_movies_usecase.dart'
    as _i13;
import 'package:tmdb_movie_app/features/movies/domain/usecases/search_movies_usecase.dart'
    as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factoryAsync<_i3.SharedPreferences>(() => registerModule.prefs);
    gh.singleton<_i4.DioService>(() => _i4.DioService());
    gh.singleton<_i5.SharedDataService>(() => _i5.SharedDataServiceImp());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i6.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i7.MoviesDatasource>(() => _i7.MoviesDatasource(gh<_i6.Dio>()));
    gh.factory<_i8.MovieRepository>(
        () => _i9.MovieRepoImpl(moviesDatasource: gh<_i7.MoviesDatasource>()));
    gh.factory<_i10.GetMovieDetailsUsecase>(() => _i10.GetMovieDetailsUsecase(
        movieRepository: gh<_i8.MovieRepository>()));
    gh.factory<_i11.GetNowPlayingMoviesUsecase>(() =>
        _i11.GetNowPlayingMoviesUsecase(
            movieRepository: gh<_i8.MovieRepository>()));
    gh.factory<_i12.GetPopularMoviesUsecase>(() => _i12.GetPopularMoviesUsecase(
        movieRepository: gh<_i8.MovieRepository>()));
    gh.factory<_i13.GetTopRatedMoviesUsecase>(() =>
        _i13.GetTopRatedMoviesUsecase(
            movieRepository: gh<_i8.MovieRepository>()));
    gh.factory<_i14.GetSearchMoviesUsecase>(() => _i14.GetSearchMoviesUsecase(
        movieRepository: gh<_i8.MovieRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
