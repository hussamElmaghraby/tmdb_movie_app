import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:tmdb_movie_app/common/constants/asset_names.dart';
import 'package:tmdb_movie_app/common/constants/dimensions.dart';
import 'package:tmdb_movie_app/common/constants/spacers.dart';
import 'package:tmdb_movie_app/common/extensions/context_extension.dart';
import 'package:tmdb_movie_app/common/singletons/theme_manager.dart';
import 'package:tmdb_movie_app/common/theme/app_colors.dart';
import 'package:tmdb_movie_app/common/theme/themes.dart';
import 'package:tmdb_movie_app/common/translation/trans_labels.dart';
import 'package:tmdb_movie_app/common/widgets/common_app_bar.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movie_details_response_entity.dart';

class MovieDetailsScreenArgs {
  final MovieDetailsResponseEntity? detailsResponseEntity;

  MovieDetailsScreenArgs({required this.detailsResponseEntity});
}

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieDetailsScreenArgs? args =
        ModalRoute.of(context)?.settings.arguments as MovieDetailsScreenArgs?;
    return Scaffold(
      backgroundColor: context.appColorScheme.secondary,
      appBar: CommonAppBar(title:args?.detailsResponseEntity?.title ??'' ,),
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Sizer.size10, vertical: Sizer.size25),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Sizer.size10),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fill,
                    placeholder: AssetNames.posterPlaceHolder,
                    image: args?.detailsResponseEntity?.posterPath ?? '',
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        fit: BoxFit.fill,
                        AssetNames.posterPlaceHolder,
                      );
                    },
                  ),
                ),
              ),
            ),
            FixedSpacers.spacerH10,
            Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizer.size10, vertical: Sizer.size5),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: context.appColorScheme.surface.withOpacity(
                      0.05,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(Sizer.size10),
                  color: context.appColorScheme.primary.withOpacity(
                    0.05,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      args?.detailsResponseEntity?.overview ?? '',
                      style: context.apptextTheme.titleSmall?.copyWith(
                        fontSize: Sizer.size12,
                      ),
                    ),
                    FixedSpacers.spacerH10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              statusLabel.tr,
                              style: context.apptextTheme.displayMedium,
                            ),
                            Text(
                              args?.detailsResponseEntity?.status ?? '',
                              style: context.apptextTheme.titleSmall,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rateLabel.tr,
                              style: context.apptextTheme.displayMedium,
                            ),
                            Text(
                              args?.detailsResponseEntity?.voteAverage.toString() ?? '',
                              style: context.apptextTheme.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
            FixedSpacers.spacerH10,
            // SizedBox(
            //   width: ResponsiveDimension.widthPercentage60,
            //   child: ElevatedButton(
            //     style: ButtonStyle(
            //       shape: WidgetStateProperty.all(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(
            //             Sizer.size10,
            //           ),
            //         ),
            //       ),
            //       backgroundColor: WidgetStateProperty.all(
            //         context.appColorScheme.primary,
            //       ),
            //     ),
            //     onPressed: () {},
            //     child: Text(
            //       watchVideoLabel.tr,
            //       style: context.apptextTheme.headlineSmall,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
