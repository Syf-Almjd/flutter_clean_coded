import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';
import 'package:flutter_clean_coded/src/presentation/modules/authentication/user_auth/authentication_page.dart';
import 'package:flutter_clean_coded/src/presentation/modules/intro/intro_screen_viewmodel.dart';
import 'package:flutter_clean_coded/src/presentation/shared/widgets_builder.dart';
import 'package:flutter_clean_coded/src/presentation/state/navigation_cubit/navi_cubit.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    IntroScreenViewmodel introScreenViewmodel = IntroScreenViewmodel();
    return IntroductionScreen(
      pages: introScreenViewmodel.pages,
      // showSkipButton: true,
      // skip: const Icon(Icons.skip),
      next: textC("Next"),
      done: textC("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      onDone: () {
        NaviCubit.get(context).navigate(context, const AuthenticationLayout());
        // On Done button pressed
      },
      // onSkip: () {
      //   // On Skip button pressed
      // },
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
