import 'package:tmdb_movie_app/inits/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;


@injectableInit
void configureDependencies() => getIt.init();


