import 'package:get_it/get_it.dart';

import 'core/data/communication_impl.dart';
import 'core/data/communication_inferface.dart';
import 'core/enums/env.dart';
import 'core/injector/feature_injector.dart';
import 'core/navigator/app_navigator_impl.dart';
import 'core/navigator/app_navigator_interface.dart';

GetIt get getIt => GetIt.I;

class Injectors {
  static List<FeatureInjector> featureInjectors = [];

  static void inject(Env env) {
    injectSingletons(env);

    for (var f in featureInjectors) {
      env == Env.prod ? f.injectDatasourcesImpl() : f.injectDatasourcesMock();
      f.inject();
    }
  }

  static void injectSingletons(Env env) {
    getIt.registerLazySingleton<CommunicationInterface>(
      () => CommunicationImpl(
          baseUrl: env == Env.prod ? '' : 'http://localhost:5000/api',
          tokenType: 'Bearer'),
    );

    getIt.registerLazySingleton<AppNavigatorInterface>(() => AppNavigator());
  }
}
