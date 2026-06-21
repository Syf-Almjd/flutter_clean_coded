import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_clean_coded/shared/widgets/components.dart';

part 'navi_state.dart';

/// Enhanced Navigation wrapper cubit for modern GoRouter and legacy compatibility.
class NaviCubit extends Cubit<NaviState> {
  NaviCubit() : super(InitialNaviState());

  static NaviCubit get(BuildContext context) => BlocProvider.of<NaviCubit>(context);

  /// -------------------------------------------------------------
  /// Modern GoRouter-Based Navigation Helper Methods
  /// -------------------------------------------------------------

  /// Navigates to the splash screen ('/').
  void navigateToSplash(BuildContext context) {
    context.go('/');
    emit(IntoPageState());
  }

  /// Navigates to the splash loading screen ('/loading').
  void navigateToLoading(BuildContext context) {
    context.go('/loading');
    emit(InitialNaviState());
  }

  /// Navigates to the intro onboarding screen ('/intro').
  void navigateToIntro(BuildContext context) {
    context.go('/intro');
    emit(IntoPageState());
  }

  /// Navigates to the authentication entry layout ('/auth').
  void navigateToAuth(BuildContext context) {
    context.go('/auth');
    emit(HomeState());
  }

  /// Navigates to the email verification screen ('/email-verification').
  void navigateToEmailVerification(BuildContext context) {
    context.go('/email-verification');
    emit(PagePushed(pageName: '/email-verification'));
  }

  /// Navigates to the forgot password page ('/forgot-password').
  void navigateToForgotPassword(BuildContext context) {
    context.go('/forgot-password');
    emit(PagePushed(pageName: '/forgot-password'));
  }

  /// Navigates to the change password page ('/change-password') with optional parameters.
  void navigateToChangePassword(BuildContext context, {required String email, bool isAnon = false}) {
    context.go('/change-password?email=${Uri.encodeComponent(email)}&isAnon=$isAnon');
    emit(PagePushed(pageName: '/change-password'));
  }

  /// Navigates to the core logged-in application shell ('/app').
  void navigateToApp(BuildContext context) {
    context.go('/app');
    emit(HomeState());
  }

  /// Navigates to the core application shell ('/app' or '/auth').
  Future<void> navigateToHome(BuildContext context) async {
    context.go('/auth');
    emit(HomeState());
  }

  /// Navigates to the admin state dashboard.
  void navigateToAdmin(BuildContext context) {
    emit(AdminState());
  }

  /// Initiates logout routing logic and resets state.
  Future<void> navigateToSliderLogout(BuildContext context) async {
    isGuestMode = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go('/');
    });
    emit(IntoPageState());
  }

  /// Pops the current route safely using GoRouter if possible, falling back to Navigator.
  void pop(BuildContext context) {
    try {
      final router = GoRouter.of(context);
      if (router.canPop()) {
        router.pop();
        emit(PagePopped(pageName: 'GoRouterPop'));
        return;
      }
    } catch (_) {}

    final currentRoute = ModalRoute.of(context);
    if (currentRoute != null && currentRoute.canPop) {
      Navigator.pop(context);
      emit(PagePopped(pageName: currentRoute.settings.name ?? 'NavigatorPop'));
    } else {
      emit(PagePopped(pageName: 'NoPageToPop'));
    }
  }

  /// -------------------------------------------------------------
  /// Legacy Navigator-Based Navigation (Backwards Compatibility)
  /// -------------------------------------------------------------

  /// Legacy helper to push a custom Widget using traditional Navigator.
  Future<void> navigate(BuildContext context, Widget widget) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
    emit(PagePushed(pageName: widget.toString()));
  }

  /// Legacy helper to replace the current screen with a new Widget.
  Future<void> navigateReplaced(BuildContext context, Widget widget) async {
    await Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => widget,
        transitionDuration: Duration.zero,
      ),
    );
    emit(PagePushed(pageName: widget.toString()));
  }

  /// Legacy helper to clear the stack and set a new Widget.
  void navigateOff(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
    emit(PagePushedOff(pageName: widget.toString()));
  }
}

