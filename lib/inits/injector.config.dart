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
    return this;
  }
}

class _$RegisterModule extends _i1071.RegisterModule {}