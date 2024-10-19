import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/dimensions.dart';
import '../../theme/app_colors.dart';

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height
  });

  final String title;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height ??  Sizer.size56,
      width: width ?? ResponsiveDimension.heightPercentage90,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.secondaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Sizer.size10,
                ),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.surfaceColor,
                ),
          )),
    );
  }
}
