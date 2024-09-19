import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_learn/container_injection.dart';
import 'container_injection.dart' as di;
import 'package:firebase_learn/core/colors/color_data.dart';
import 'package:firebase_learn/core/routes/app_router.dart';
import 'package:firebase_learn/core/routes/router_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

void main() async {
  await initializeDateFormatting('id_ID', null);
  DartPluginRegistrant.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  dotenv.load(fileName: '.env');
  await Firebase.initializeApp();
  setupRouterDependencies();
  Logger logger = Logger();
  FlutterError.onError = (error) {
    logger.e("Error Log", error: error);
  };
  PlatformDispatcher.instance.onError = (error, stacktrace) {
    logger.e("Error Asynchronous Log", error: error, stackTrace: stacktrace);
    return true;
  };
  await sl.allReady().whenComplete(() => runApp(const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: ThemeData(
        disabledColor: ColorData.grey400,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorData.primary500),
        useMaterial3: true,
      ),
    );
  }
}
