import 'package:go_router/go_router.dart';

import '../../injectors.dart';
import '../authentication/firebase_helper.dart';
import 'app_navigator_interface.dart';
import 'routes.dart';

class AppNavigator implements AppNavigatorInterface {
  static FirebaseHelper firebaseHelper = getIt<FirebaseHelper>();

  static final List<GoRoute> routes = [];

  static final router = GoRouter(
    initialLocation:
        firebaseHelper.isAuthenticate() ? Routes.home : Routes.login,
    routes: routes,
  );

  @override
  Future push<T>(String location, {Object? extra}) {
    return router.push<T>(location, extra: extra);
  }

  @override
  void pushReplacement<T>(String location, {Object? extra}) {
    router.pushReplacement(location, extra: extra);
  }

  @override
  void pop<T extends Object?>([T? result]) {
    router.pop<T>(result);
  }
}
