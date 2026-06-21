import 'package:animate_do/animate_do.dart';
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

/// Screen allowing the user to initiate a password reset request.
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final validateKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appCustomCancelBar('Reset Password', context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(10, context),
          vertical: getHeight(5, context),
        ),
        child: Form(
          key: validateKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.grey.withOpacityPercent(0.2),
            ),
            child: Column(
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
                          Ionicons.lock_open_outline,
                          color: Colors.white,
                          size: getWidth(10, context),
                        ),
                      ),
                    ),
                    Flexible(
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
                  text: "Forgot Password?",
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
                  text: "No worries!",
                  fontSize: AppFontSize.s14,
                ),
                getCube(5, context),
                FadeInUp(
                  from: 10,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        showToast(
                          "Your Email is incorrect!",
                          AppColors.primaryColor,
                          context,
                        );
                        return "Your Email is incorrect";
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: getLocaleText("Email"),
                      prefixIcon: const Icon(
                        Icons.alternate_email,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                getCube(4, context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: loadButtonOutline(
                      context: context,
                      onPressed: () async {
                        if (validateForm(validateKey)) {
                          resetPassword(emailController.text, context);
                        }
                      },
                      buttonHeight: getHeight(5, context),
                      buttonWidth: getWidth(60, context),
                      buttonText: "Send OTP",
                      borderWidth: 1,
                      borderCurveSize: 10,
                      fontSize: AppFontSize.s14,
                    ),
                  ),
                ),
                getCube(1, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void resetPassword(String email, BuildContext context) {
    NaviCubit.get(context).navigateToChangePassword(context, email: email, isAnon: true);
  }
}
