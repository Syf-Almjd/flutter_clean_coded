import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_kit/clean_arch_kit.dart';

part 'user_auth_page_state.dart';

/// Cubit managing switching states of the Auth Layout (Login vs Signup vs Initial chooser).
class UserAuthPageCubit extends BaseCubit<UserAuthPageState> {
  UserAuthPageCubit() : super(UserAuthPageInitial());

  static UserAuthPageCubit get(context) => BlocProvider.of<UserAuthPageCubit>(context);

  /// Emits the new state of the page.
  void changeState(UserAuthPageState state) => emit(state);

  /// Resets the page state back to Initial.
  void resetState() => emit(UserAuthPageInitial());
}
