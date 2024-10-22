import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/common/constants/dimensions.dart';
import 'package:tmdb_movie_app/common/extensions/context_extension.dart';

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: Sizer.size10),
        padding: const EdgeInsets.symmetric(
          vertical: Sizer.size45,
        ),
        decoration: BoxDecoration(
          color: context.appColorScheme.primary.withOpacity(0.2),
          gradient: LinearGradient(colors: [
            context.appColorScheme.primary,
            context.appColorScheme.error
          ]),
          borderRadius: BorderRadius.circular(
            Sizer.size20,
          ),
          border: Border.all(color:context.appColorScheme.error.withOpacity(0.4) )
        ),
        child: Center(
          child: Text(
            title,
            style: context.apptextTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
