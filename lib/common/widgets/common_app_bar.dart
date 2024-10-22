
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_movie_app/common/constants/dimensions.dart';
import 'package:tmdb_movie_app/common/constants/spacers.dart';
import 'package:tmdb_movie_app/common/extensions/context_extension.dart';
import 'package:tmdb_movie_app/common/translation/trans_labels.dart';

import '../singletons/theme_manager.dart';


class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key, required this.title, this.hasBack = true});

  final String title;
  final bool hasBack;

  @override
  Widget build(BuildContext context) {
    return  PreferredSize(
      preferredSize: const Size.fromHeight(Sizer.size120),
      child: AppBar(
        leading:  BackButton(
          color:  Theme.of(context).primaryColor,
        ),
        title: Text(
          title ?? '',
          style: context.apptextTheme.titleSmall,
        ),
        actions: [
          TextButton(child: Text(ThemeManager().isDark ? darkLabel.tr : lightLabel.tr, style: context.apptextTheme.titleSmall,), onPressed: (){
            ThemeManager().changeTheme();
          },)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Sizer.size90);
}
