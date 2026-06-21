import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_clean_coded/app/l10n/app_localizations.dart';
import 'package:flutter_clean_coded/app/theme/app_colors.dart';
import 'package:flutter_clean_coded/app/theme/app_fonts.dart';
import 'package:flutter_clean_coded/core/constants/app_assets.dart';
import 'package:flutter_clean_coded/core/extensions/app_extensions.dart';
import 'package:flutter_clean_coded/shared/widgets/components.dart';
import 'package:flutter_clean_coded/shared/widgets/widgets_builder.dart';

import 'package:flutter_clean_coded/shared/helpers/navigation/navi_cubit.dart';

/// Screen allowing the user to set a new password after verifying the OTP.
class ChangePasswordScreen extends StatefulWidget {
  final String userEmail;
  final bool isAnonRequest;

  const ChangePasswordScreen({
    super.key,
    required this.userEmail,
    required this.isAnonRequest,
  });

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController otpPass = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController newPasswordConfirm = TextEditingController();
  final _validateKey = GlobalKey<FormState>();
  bool isOTPCorrect = true; // Set to true by default for demo/stubs, or false depending on logic.

  @override
  void initState() {
    resetPassword();
    super.initState();
  }

  Future<void> resetPassword() async {
    // Send OTP logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appCustomCancelBar('Change Password', context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(10, context),
          vertical: getHeight(5, context),
        ),
        child: Form(
          key: _validateKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                            child: const Icon(
                              Ionicons.lock_open_outline,
                              color: Colors.white,
                              size: 40,
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
                      text: "No worries!",
                      fontSize: AppFontSize.s16,
                      alignment: TextAlign.start,
                      fontWeight: FontWeight.w900,
                    ),
                    fadedText(
                      paddingSize: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      context: context,
                      text: "We have sent you an OTP",
                      fontSize: AppFontSize.s14,
                    ),
                    fadedText(
                      paddingSize: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      context: context,
                      fontWeight: FontWeight.w700,
                      text: "Email: ${widget.userEmail.toCapitalize()}",
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
                    Visibility(
                      replacement: Center(
                        child: loadButton(
                          onPressed: () async {
                            if (otpPass.text.isNotEmpty) {
                              setState(() {
                                isOTPCorrect = true;
                              });
                            } else {
                              showToast(
                                "Your OTP is incorrect",
                                AppColors.redColor,
                                context,
                              );
                            }
                          },
                          buttonHeight: getHeight(5, context),
                          buttonWidth: getWidth(60, context),
                          buttonText: "Next",
                          context: context,
                          borderCurveSize: 10,
                          fontSize: AppFontSize.s18,
                        ),
                      ),
                      visible: isOTPCorrect,
                      child: Column(
                        children: [
                          FadeInUp(
                            from: 10,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return getLocaleText("Too short password");
                                }
                                if (value.length < 8) {
                                  return getLocaleText("At least 8 characters long");
                                }
                                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                  return getLocaleText("Please add one uppercase letter");
                                }
                                if (!RegExp(r'[a-z]').hasMatch(value)) {
                                  return getLocaleText("Please add one lowercase letter");
                                }
                                if (!RegExp(r'[0-9]').hasMatch(value)) {
                                  return getLocaleText("Please add one digit");
                                }
                                return null;
                              },
                              controller: newPassword,
                              decoration: InputDecoration(
                                labelText: "New Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                prefixIcon: const Icon(
                                  Icons.password_rounded,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                          getCube(2, context),
                          FadeInUp(
                            from: 10,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || value != newPassword.text) {
                                  return getLocaleText("New Passwords doesn't match");
                                }
                                return null;
                              },
                              controller: newPasswordConfirm,
                              decoration: InputDecoration(
                                labelText: "Confirm new password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                prefixIcon: const Icon(
                                  Icons.password_rounded,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                          getCube(5, context),
                          Center(
                            child: loadButton(
                              onPressed: () async {
                                if (validateForm(_validateKey)) {
                                  changePassSubmit();
                                }
                              },
                              context: context,
                              buttonHeight: getHeight(5, context),
                              buttonWidth: getWidth(60, context),
                              buttonText: "Set Password",
                              borderCurveSize: 10,
                              fontSize: AppFontSize.s14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changePassSubmit() {
    NaviCubit.get(context).navigateToAuth(context);
  }
}
