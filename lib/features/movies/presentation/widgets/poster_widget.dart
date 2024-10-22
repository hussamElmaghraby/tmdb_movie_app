import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/common/constants/asset_names.dart';
import 'package:tmdb_movie_app/common/constants/dimensions.dart';
import 'package:tmdb_movie_app/common/constants/spacers.dart';
import 'package:tmdb_movie_app/common/extensions/context_extension.dart';
import 'package:tmdb_movie_app/features/movies/domain/entities/movies_response_entity.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({super.key, required this.movie, required this.onTap});

  final ResultsEntity? movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(Sizer.size2),
        padding: const EdgeInsets.all(Sizer.size10),
        decoration: BoxDecoration(
          color: context.appColorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Sizer.size10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Sizer.size10),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fill,
                    placeholder: AssetNames.posterPlaceHolder,
                    image: movie?.posterPath ?? '',
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        fit: BoxFit.fill,
                        AssetNames.posterPlaceHolder,
                        // width: 300,
                        // height: 400,
                      );
                    },
                  ),
                ),
              ),
            ),
            FixedSpacers.spacerH10,
            Text(
              movie?.title ?? '',
              style: context.apptextTheme.titleSmall
                  ?.copyWith(fontSize: Sizer.size13),
            )
          ],
        ),
      ),
    );
  }
}
