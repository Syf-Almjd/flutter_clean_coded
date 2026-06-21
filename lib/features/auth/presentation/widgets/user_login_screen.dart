import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_coded/app/l10n/app_localizations.dart';
import 'package:flutter_clean_coded/app/theme/app_colors.dart';
import 'package:flutter_clean_coded/app/theme/app_fonts.dart';
import 'package:flutter_clean_coded/core/extensions/app_extensions.dart';
import 'package:flutter_clean_coded/features/auth/presentation/cubit/user_auth_page_cubit.dart';
import 'package:flutter_clean_coded/shared/widgets/components.dart';
import 'package:flutter_clean_coded/shared/widgets/widgets_builder.dart';

import 'package:flutter_clean_coded/shared/helpers/navigation/navi_cubit.dart';

/// The user login form view container.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final _validateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _validateKey,
      child: ListView(
        padding: appCustomPadding(
          horizontal: 20,
          vertical: 50,
          context: context,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  UserAuthPageCubit.get(context).changeState(UserAuthPageInitial());
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.grey,
                  size: getWidth(10, context),
                ),
              ),
              fadedText(
                context: context,
                text: "Welcome Back",
                textColor: AppColors.darkColor,
                fontSize: AppFontSize.s16,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(width: getWidth(10, context)),
            ],
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
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(200),
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
          getCube(5, context),
          FadeInUp(
            from: 10,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || value.length <= 3) {
                  return "Wrong Password";
                }
                return null;
              },
              controller: pass,
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(200),
                ),
                labelText: getLocaleText("Password"),
                prefixIcon: const Icon(
                  Icons.password_outlined,
                  color: AppColors.primaryColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
          ),
          getCube(2, context),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            child: InkWell(
              child: textC(
                "Forgot Password?",
                softWrap: true,
                style: TextStyle(color: Colors.grey.withOpacityPercent(0.6)),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                NaviCubit.get(context).navigateToForgotPassword(context);
              },
            ),
          ),
          getCube(5, context),
          loadButton(
            borderCurveSize: 10,
            context: context,
            buttonWidth: getWidth(100, context),
            textWeight: FontWeight.w600,
            fontSize: AppFontSize.s16,
            buttonText: "Login",
            onPressed: () {
              NaviCubit.get(context).navigateToApp(context);
            },
          ),
        ],
      ),
    );
  }
}
