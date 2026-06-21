import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_coded/app/l10n/app_localizations.dart';
import 'package:flutter_clean_coded/app/theme/app_colors.dart';
import 'package:flutter_clean_coded/app/theme/app_fonts.dart';
import 'package:flutter_clean_coded/core/extensions/app_extensions.dart';
import 'package:flutter_clean_coded/features/auth/presentation/cubit/user_auth_page_cubit.dart';
import 'package:flutter_clean_coded/shared/widgets/common/components.dart';
import 'package:flutter_clean_coded/shared/widgets/common/widgets_builder.dart';

/// The user registration form view container.
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isObscure = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final _validateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _validateKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 120),
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
                text: "Welcome to CleanCode Premium!",
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
                  Icons.email_outlined,
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
          getCube(5, context),
          FadeInUp(
            from: 10,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty || value.length <= 3) {
                  return "Short Password";
                }
                if (value != pass.text) {
                  return "Password doesn't match!";
                }
                return null;
              },
              controller: confirmPassword,
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(200),
                ),
                labelText: getLocaleText("Confirm Password"),
                prefixIcon: const Icon(
                  Icons.safety_check_outlined,
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
                "Are you an existing user?",
                softWrap: true,
                style: TextStyle(color: Colors.grey.withOpacityPercent(0.6)),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                UserAuthPageCubit.get(context).changeState(UserLoginState());
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
            buttonText: "Signup",
            onPressed: () {
              if (validateForm(_validateKey)) {
                submitRequest();
              }
            },
          ),
        ],
      ),
    );
  }

  void submitRequest() {
    // SignUpModelRequest registration logic
  }
}
