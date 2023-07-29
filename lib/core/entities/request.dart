import 'package:equatable/equatable.dart';

class AppRequest extends Equatable {
  final String path;
  final String data;
  final Map<String, dynamic>? queryParameters;

  const AppRequest({
    required this.path,
    required this.data,
    this.queryParameters,
  });

  @override
  List<Object?> get props => [path, data, queryParameters];
}
