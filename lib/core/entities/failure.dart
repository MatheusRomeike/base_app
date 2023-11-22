import '../i18n/i18n.dart';

class Failure implements Exception {
  final String title;
  final String message;

  Failure({required this.message}) : title = I18n.strings.titleError;

  @override
  String toString() {
    return message;
  }
}
