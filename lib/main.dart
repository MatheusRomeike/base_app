import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';

import 'core/enums/env.dart';
import 'core/i18n/i18n.dart';
import 'core/navigator/app_navigator_impl.dart';
import 'injectors.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<void> _init() async {
    Injectors.inject(Env.prod);
    I18n.load(
      Intl.getCurrentLocale(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.red.shade800));
    return FutureBuilder(
      future: _init(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return MaterialApp.router(
          theme: ThemeData(
            fontFamily: 'Poppins',
            primarySwatch: Colors.red,
          ),
          routerConfig: AppNavigator.router,
        );
      },
    );
  }
}
