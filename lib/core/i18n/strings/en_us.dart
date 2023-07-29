import '../translations.dart';

class EnUs implements Translations {
  @override
  String get loginSuccess => 'Login successful.';

  @override
  String get unauthorized => 'Unauthorized. Please login again.';

  @override
  String get appName => 'Sample App';

  @override
  String get resourceNotFound => 'Resource not found.';

  @override
  String get loading => 'Loading...';
}
