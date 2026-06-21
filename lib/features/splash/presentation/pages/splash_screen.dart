import 'package:flutter/material.dart';
import 'package:flutter_clean_coded/app/theme/app_colors.dart';
import 'package:flutter_clean_coded/app/theme/app_fonts.dart';
import 'package:flutter_clean_coded/shared/widgets/components.dart';
import 'package:flutter_clean_coded/shared/widgets/widgets_builder.dart';
import 'package:flutter_clean_coded/shared/helpers/navigation/navi_cubit.dart';

/// The standard welcome splash screen of the application.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, right: 30),
            alignment: Alignment.topRight,
            child: OutlinedButton(
              onPressed: () {
                showToast(
                  "Al momento è supportato solo l'italiano 🇮🇹",
                  AppColors.primaryColor,
                  context,
                );
              },
              child: textC("Italiano  🇮🇹 ", preText: "🌐  : "),
            ),
          ),
          Center(
            child: appLogoPreview(
              context: context,
              width: getWidth(100, context),
              height: getHeight(8, context),
              wBackground: false,
            ),
          ),
          textC(
            "Welcome to CleanCode Premium!",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppFontSize.s16,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          lottieNetworkContainer(
            height: getHeight(40, context),
            context: context,
            url: "https://lottie.host/56eabded-b759-4908-856f-067582778316/YHen8tgqR0.json",
          ),
          loadButtonOutline(
            context: context,
            isLoadButton: false,
            onPressed: () {
              NaviCubit.get(context).navigateToIntro(context);
            },
            buttonText: "Get started!",
            fontSize: AppFontSize.s16,
          ),
        ],
      ),
    );
  }
}
