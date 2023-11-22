import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/authentication/firebase_helper.dart';
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
    if (getIt.isRegistered<FirebaseHelper>() == false) {
      injectSingletons(env);

      for (var f in featureInjectors) {
        env == Env.prod ? f.injectDatasourcesImpl() : f.injectDatasourcesMock();
        f.inject();
      }
    }
  }

  static void injectSingletons(Env env) {
    getIt
      ..registerLazySingleton(() => FirebaseHelper(
          firebaseAuth: FirebaseAuth.instance, googleSignIn: GoogleSignIn()))
      ..registerLazySingleton<CommunicationInterface>(
          () => CommunicationImpl(firebase: FirebaseFirestore.instance))
      ..registerLazySingleton<AppNavigatorInterface>(() => AppNavigator());
  }

  static void registerUser(User user) {
    if (getIt.isRegistered<User>()) {
      return;
    }

    getIt.registerLazySingleton<User>(() => user);
  }
}
