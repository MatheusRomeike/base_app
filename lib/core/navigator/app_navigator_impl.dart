import '../../injectors.dart';
import '../storage/storage_helper.dart';
import 'app_navigator_interface.dart';
import 'routes.dart';
import 'package:go_router/go_router.dart';

class AppNavigator implements AppNavigatorInterface {
  static StorageHelper secureStorageHelper = getIt<StorageHelper>();

  static final List<GoRoute> routes = [
    // GoRoute(
    //   path: Routes.home,
    //   builder: (_, __) => const HomePage(),
    // ),
    // GoRoute(
    //   path: Routes.login,
    //   builder: (_, __) => const LoginPage(),
    // ),
  ];

  static final router = GoRouter(
    // initialLocation:
    //     secureStorageHelper.isAuthenticated() ? Routes.home : Routes.login,
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
