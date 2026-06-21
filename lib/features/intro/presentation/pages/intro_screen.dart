import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_clean_coded/app/theme/app_colors.dart';
import 'package:flutter_clean_coded/features/intro/presentation/pages/intro_screen_viewmodel.dart';
import 'package:flutter_clean_coded/shared/widgets/widgets_builder.dart';

import 'package:flutter_clean_coded/shared/helpers/navigation/navi_cubit.dart';

/// App onboarding intro screen.
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final introScreenViewmodel = IntroScreenViewmodel();
    return IntroductionScreen(
      pages: introScreenViewmodel.pages,
      next: textC("Next"),
      done: textC("Done", style: const TextStyle(fontWeight: FontWeight.w700)),
      onDone: () {
        NaviCubit.get(context).navigateToAuth(context);
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: AppColors.primaryColor,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
