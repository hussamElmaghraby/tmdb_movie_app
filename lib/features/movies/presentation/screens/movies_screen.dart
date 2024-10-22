import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:tmdb_movie_app/common/constants/dimensions.dart';
import 'package:tmdb_movie_app/common/constants/spacers.dart';
import 'package:tmdb_movie_app/common/exceptions/network_exceptions.dart';
import 'package:tmdb_movie_app/common/extensions/context_extension.dart';
import 'package:tmdb_movie_app/common/routes/names.dart';
import 'package:tmdb_movie_app/common/translation/index.dart';
import 'package:tmdb_movie_app/common/widgets/common_app_bar.dart';
import 'package:tmdb_movie_app/common/widgets/loaders/loader_widget.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movie_details_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movies_response_entity.dart';
import 'package:tmdb_movie_app/features/movies/presentation/state_managment/movies_bloc.dart';
import 'package:tmdb_movie_app/features/movies/presentation/state_managment/movies_events.dart';
import 'package:tmdb_movie_app/features/movies/presentation/state_managment/movies_states.dart';
import 'package:tmdb_movie_app/features/movies/presentation/widgets/poster_widget.dart';

import 'movie_details_screen.dart';

class MoviesScreenArgs {
  final MoviesResponseEntity? moviesResponseEntity;

  MoviesScreenArgs({
    required this.moviesResponseEntity,
  });
}

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({
    super.key,
  });

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  MovieDetailsResponseEntity? _detailsResponseEntity;

  @override
  Widget build(BuildContext context) {
    final MoviesScreenArgs? args =
        ModalRoute.of(context)?.settings.arguments as MoviesScreenArgs?;
    return Scaffold(
      backgroundColor: context.appColorScheme.secondary,
      appBar: CommonAppBar(
        title: moviesLabel.tr,
      ),
      body: BlocConsumer<MoviesBloc, MoviesState>(
        listener: (context, state) {
          if (state is MoviesLoadingState) {
            context.loaderOverlay
                .show(widgetBuilder: (_) => const AppLoaderWidget());
          }
          if (state is MovieDetailsSuccessState) {
            context.loaderOverlay.hide();
            _detailsResponseEntity = state.movieDetailsResponseEntity;
            Get.toNamed(AppRoutes.MOVIE_DETAILS,
                arguments: MovieDetailsScreenArgs(
                    detailsResponseEntity: _detailsResponseEntity));
          }
          if (state is MoviesErrorState) {
            context.loaderOverlay.hide();

            ApiExceptionHandler.handleException(context, error: state.error);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              FixedSpacers.spacerH20,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: Sizer.size10),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      shrinkWrap: true,
                      itemCount: args?.moviesResponseEntity?.results.length,
                      itemBuilder: (ctx, idx) {
                        final movies = args?.moviesResponseEntity?.results;
                        return PosterWidget(
                          movie: movies?[idx],
                          onTap: () {
                            context.read<MoviesBloc>().add(
                                  GetMovieDetailsEvent(
                                    movieId: movies?[idx].id,
                                  ),
                                );
                          },
                        );
                      }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
