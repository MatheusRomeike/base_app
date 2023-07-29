import '../entities/request.dart';

abstract class CommunicationInterface {
  Future get(AppRequest request);
  Future post(AppRequest request);
  Future put(AppRequest request);
  Future delete(AppRequest request);
}
