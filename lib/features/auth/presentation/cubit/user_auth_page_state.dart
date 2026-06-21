part of 'user_auth_page_cubit.dart';

/// Represents the states of the Authentication Layout screen.
sealed class UserAuthPageState {}

/// Default initial state showing choices to Login/Signup.
class UserAuthPageInitial extends UserAuthPageState {}

/// State representing guest mode initialization.
class GuestModeState extends UserAuthPageState {}

/// State showing the Signup layout.
class UserSignupState extends UserAuthPageState {}

/// State showing the Login layout.
class UserLoginState extends UserAuthPageState {}
