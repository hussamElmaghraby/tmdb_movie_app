import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tmdb_movie_app/app/app.dart';
import 'package:tmdb_movie_app/common/constants/dimensions.dart';
import 'package:tmdb_movie_app/common/exceptions/network_exceptions.dart';
import 'package:tmdb_movie_app/common/extensions/context_extension.dart';
import 'package:tmdb_movie_app/common/routes/index.dart';
import 'package:tmdb_movie_app/common/translation/trans_labels.dart';
import 'package:tmdb_movie_app/common/widgets/common_app_bar.dart';
import 'package:tmdb_movie_app/common/widgets/loaders/loader_widget.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movies_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tmdb_movie_app/features/movies/presentation/screens/movies_screen.dart';
import 'package:tmdb_movie_app/features/movies/presentation/state_managment/movies_bloc.dart';
import 'package:tmdb_movie_app/features/movies/presentation/state_managment/movies_events.dart';
import 'package:tmdb_movie_app/features/movies/presentation/state_managment/movies_states.dart';
import 'package:tmdb_movie_app/features/movies/presentation/widgets/feature_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MoviesResponseEntity? _moviesResponseEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColorScheme.secondary,
      appBar: CommonAppBar(
        title: homeLabel.tr,
      ),
      body: Container(
        padding: const EdgeInsets.all(
          Sizer.size20,
        ),
        child: BlocConsumer<MoviesBloc, MoviesState>(
          listener: (ctx, state) {
            if (state is MoviesLoadingState) {
              context.loaderOverlay
                  .show(widgetBuilder: (_) => const AppLoaderWidget());
            }
            if (state is MoviesSuccessState) {
              context.loaderOverlay.hide();
              _moviesResponseEntity = state.moviesResponseEntity;
              Get.toNamed(AppRoutes.MOVIES,
                  arguments: MoviesScreenArgs(
                      moviesResponseEntity: _moviesResponseEntity));
            }
            if (state is MoviesErrorState) {
              context.loaderOverlay.hide();

              ApiExceptionHandler.handleException(context,
                  error: state.error);
            }
          },
          builder: (ctx, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                featuresLabel.tr,
                style: context.apptextTheme.titleMedium,
              ),
              FeatureWidget(
                title: topRatedLabel.tr,
                onTap: () {
                  ctx.read<MoviesBloc>().add(GetTopRatedEvent());
                },
              ),
              FeatureWidget(
                title: nowPlayingLabel.tr,
                onTap: () {
                  ctx.read<MoviesBloc>().add(GetNowPlayingEvent());
                },
              ),
              FeatureWidget(
                title: popularLabel.tr,
                onTap: () {
                  ctx.read<MoviesBloc>().add(GetPopularEvent());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
