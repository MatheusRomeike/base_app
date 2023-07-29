import 'package:base_app/core/entities/request.dart';

extension RequestSample on AppRequest {
  static AppRequest get sample => const AppRequest(
        path: 'path',
        data: 'data',
        queryParameters: {'key': 'value'},
      );
}
