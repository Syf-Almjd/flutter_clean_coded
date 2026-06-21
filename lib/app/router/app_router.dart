import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flutter_clean_coded/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter_clean_coded/features/splash/presentation/pages/splash_loading_screen.dart';
import 'package:flutter_clean_coded/features/intro/presentation/pages/intro_screen.dart';
import 'package:flutter_clean_coded/features/auth/presentation/pages/authentication_page.dart';
import 'package:flutter_clean_coded/features/auth/presentation/pages/email_verification_page.dart';
import 'package:flutter_clean_coded/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:flutter_clean_coded/features/auth/presentation/pages/change_password_screen.dart';
import 'package:flutter_clean_coded/features/app_shell/presentation/pages/app_module_router.dart';
import 'package:clean_arch_kit/clean_arch_kit.dart';

/// The central GoRouter instance configuration for the application.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  observers: [
    // Register the talker observer for navigation logging if desired
    TalkerRouteObserver(AppLogger.talker),
  ],
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/loading',
      builder: (context, state) => const SplashLoadingScreen(),
    ),
    GoRoute(
      path: '/intro',
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthenticationLayout(),
    ),
    GoRoute(
      path: '/email-verification',
      builder: (context, state) => const EmailVerificationPage(),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/change-password',
      builder: (context, state) {
        final email = state.uri.queryParameters['email'] ?? '';
        final isAnon = state.uri.queryParameters['isAnon'] == 'true';
        return ChangePasswordScreen(userEmail: email, isAnonRequest: isAnon);
      },
    ),
    GoRoute(
      path: '/app',
      builder: (context, state) => const AppModuleRouter(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri}'),
    ),
  ),
);
