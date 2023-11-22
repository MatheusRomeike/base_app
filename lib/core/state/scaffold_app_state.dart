import 'app_state.dart';

class ScaffoldAppState<T> extends AppState<T> {
  final String? onSuccessMessage;
  String get onErrorMessage => error?.toString() ?? '';
  final String? onLoadingMessage;

  ScaffoldAppState({
    this.onSuccessMessage,
    this.onLoadingMessage,
  });
}
