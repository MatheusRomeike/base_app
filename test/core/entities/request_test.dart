import 'package:flutter_test/flutter_test.dart';
import 'package:base_app/core/entities/request.dart';

import '../../samples/entities/request_sample.dart';

void main() {
  test('construct a Request corretly', () async {
    const request = AppRequest(
        path: 'path', data: 'data', queryParameters: {'key': 'value'});
    final sample = RequestSample.sample;

    expect(request, sample);
  });
}
