import 'package:tmdb_movie_app/common/constants/spacers.dart';
import 'package:tmdb_movie_app/common/extensions/context_extension.dart';
import 'package:tmdb_movie_app/common/theme/app_colors.dart';
import 'package:tmdb_movie_app/common/widgets/buttons/primary_app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../translation/trans_labels.dart';

class AppHintDialog extends StatelessWidget {
  const AppHintDialog({super.key, this.title, this.message, this.actionTitle, this.onTapAction});

  final String? title;
  final String? message;
  final String? actionTitle;
  final VoidCallback? onTapAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message ?? '',
            style: context.apptextTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          FixedSpacers.spacerH25,
          AppPrimaryButton(
            title: actionTitle ,
            onPressed: onTapAction ?? () => Get.back(),
          ),
        ],
      ),
      title: Text(
        title ?? 'Error',
        textAlign: TextAlign.center,
        style:
            context.apptextTheme.headlineLarge?.copyWith(color: AppColors.red),
      ),
    );
  }
}
