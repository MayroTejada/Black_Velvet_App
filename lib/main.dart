import 'dart:io';

import 'package:black_velvet_app/app_router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.light : Brightness.dark,
      statusBarIconBrightness:
          Platform.isAndroid ? Brightness.light : Brightness.dark,
    ));
  } else if (kIsWeb) {}
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Black Velvet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, child) => ResponsiveBreakpoints(breakpoints: const [
              Breakpoint(start: 0, end: 450, name: MOBILE),
              Breakpoint(start: 451, end: 800, name: TABLET),
              Breakpoint(start: 801, end: 1920, name: DESKTOP),
              Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ], child: child!),
        routerConfig: router.config());
  }
}
