import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_coded/src/presentation/shared/widgets_builder.dart';

class AppBlocObserver extends BlocObserver {
  static Future<void> init() async {
    Bloc.observer = AppBlocObserver();
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    printC('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    printC('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    printC('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    printC('onClose -- ${bloc.runtimeType}');
  }
}
