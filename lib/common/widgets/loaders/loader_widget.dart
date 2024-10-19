import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../constants/dimensions.dart';
import '../../theme/app_colors.dart';

class AppLoaderWidget extends StatelessWidget {
  const AppLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: AppColors.primaryColor,
        size: Sizer.size50,
      ),
    );
  }
}
