import 'package:tmdb_movie_app/common/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/dimensions.dart';
import '../../theme/app_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    this.title,
    required this.onPressed,
    this.customTitle,
    this.enabled = true,
    this.height,
  });

  final String? title;
  final VoidCallback? onPressed;
  final Widget? customTitle;
  final bool? enabled;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Sizer.size56,
      width: ResponsiveDimension.heightPercentage90,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              enabled == true
                  ? AppColors.primaryColor
                  : AppColors.appDimmedDiscount,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Sizer.size10,
                ),
              ),
            ),
          ),
          onPressed: onPressed,
          child: customTitle ??
              Text(
                title ?? '',
                style: enabled == true
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryColor.withOpacity(0.2),
                        ),
              )),
    );
  }
}
