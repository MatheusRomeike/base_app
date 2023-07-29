import 'package:dio/dio.dart';

import '../entities/request.dart';
import '../i18n/i18n.dart';
import '../print/print.dart';
import '../storage/storage.dart';
import 'communication_inferface.dart';

class CommunicationImpl implements CommunicationInterface {
  final client = Dio();
  final storage = Storage();

  CommunicationImpl({required baseUrl, required String tokenType}) {
    client.options.baseUrl = baseUrl;
    client.interceptors.add(_onRequest(tokenType: tokenType));
    client.interceptors.add(_onUnauthorized());
  }

  InterceptorsWrapper _onRequest({required String tokenType}) {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await storage.readOne(key: 'token');
        if (token != null) {
          options.headers['Authorization'] = '$tokenType $token';
        }
        return handler.next(options);
      },
    );
  }

  InterceptorsWrapper _onUnauthorized() {
    return InterceptorsWrapper(
      onError: (err, handler) async {
        String? token = await storage.readOne(key: 'token');
        if (err.response?.statusCode == 401 && token != null) {
          await storage.deleteOne(key: 'token');
          //try login
        } else {
          throw Exception(I18n.strings.unauthorized);
        }
      },
    );
  }

  @override
  Future get(AppRequest request) async {
    var res = await client.get(request.path,
        data: request.data, queryParameters: request.queryParameters);

    if (res.data == null) {
      throw Exception(I18n.strings.resourceNotFound);
    }

    return res.data;
  }

  @override
  Future post(AppRequest request) async {
    var res = await client.post(request.path,
        data: request.data, queryParameters: request.queryParameters);

    debugPrint(res.data);

    return res.data;
  }

  @override
  Future delete(AppRequest request) async {
    var res = await client.delete(request.path,
        data: request.data, queryParameters: request.queryParameters);
    return res.data;
  }

  @override
  Future put(AppRequest request) async {
    var res = await client.put(request.path,
        data: request.data, queryParameters: request.queryParameters);
    return res.data;
  }
}
