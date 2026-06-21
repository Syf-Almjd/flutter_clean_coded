import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_clean_coded/app/l10n/app_localizations.dart';
import 'package:flutter_clean_coded/app/theme/app_colors.dart';
import 'package:flutter_clean_coded/app/theme/app_fonts.dart';
import 'package:flutter_clean_coded/core/constants/app_assets.dart';
import 'package:flutter_clean_coded/core/extensions/app_extensions.dart';
import 'package:flutter_clean_coded/shared/widgets/common/components.dart';
import 'package:flutter_clean_coded/shared/widgets/common/widgets_builder.dart';

import 'package:flutter_clean_coded/shared/navigation/navi_cubit.dart';

/// Screen requiring verification code verification.
class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool isOTPCorrect = false;
  final TextEditingController otpPass = TextEditingController();
  String userEmail = '';

  @override
  void initState() {
    getEmail();
    super.initState();
  }

  Future<void> getEmail() async {
    // Retreive email logic
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: textC("Verify Email")),
      body: ListView(
        children: [
          getCube(5, context),
          Container(
            margin: EdgeInsets.symmetric(horizontal: getWidth(7, context)),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.grey.withOpacityPercent(0.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    FadeInUp(
                      from: 10,
                      delay: const Duration(milliseconds: 400),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Ionicons.ellipsis_horizontal_outline,
                          color: Colors.white,
                          size: getWidth(10, context),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FadeInUp(
                        from: 20,
                        delay: const Duration(milliseconds: 500),
                        child: Image.asset(AppAssets.forgotImage),
                      ),
                    ),
                  ],
                ),
                getCube(5, context),
                fadedText(
                  context: context,
                  text: "Check your Email!",
                  fontSize: AppFontSize.s14,
                  alignment: TextAlign.start,
                  fontWeight: FontWeight.w900,
                ),
                fadedText(
                  paddingSize: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  context: context,
                  fontWeight: FontWeight.w700,
                  text: "Email: $userEmail",
                  fontSize: AppFontSize.s14,
                ),
                getCube(2, context),
                FadeInUp(
                  from: 10,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Your OTP is incorrect";
                      }
                      return null;
                    },
                    controller: otpPass,
                    decoration: InputDecoration(
                      labelText: getLocaleText("OTP Code"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      prefixIcon: const Icon(
                        Icons.do_not_disturb_on_total_silence_outlined,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                getCube(2, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        showChoiceDialog(
                          context: context,
                          title: "Logout",
                          content: "Are you sure you want to quit?",
                          onYes: () {
                            NaviCubit.get(context).navigateToAuth(context);
                          },
                        );
                      },
                      child: textC(
                        "Logout",
                        style: const TextStyle(fontSize: AppFontSize.s12),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryLight,
                      ),
                      onPressed: () async {
                        checkVerify();
                      },
                      icon: const Icon(
                        CupertinoIcons.checkmark_shield,
                        color: AppColors.white,
                      ),
                      label: const Text(
                        "Verify & Continue",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: AppFontSize.s14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> checkVerify() async {
    NaviCubit.get(context).navigateToApp(context);
  }
}
