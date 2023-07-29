import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'core/enums/env.dart';
import 'core/i18n/i18n.dart';
import 'core/navigator/app_navigator_impl.dart';
import 'injectors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return FutureBuilder(
      future: _init(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return MaterialApp.router(
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          routerConfig: AppNavigator.router,
        );
      },
    );
  }
}
