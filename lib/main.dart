import 'package:flutter/material.dart';
import 'package:goshop/injection.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/config/app_router.dart';
import 'src/config/app_theme.dart';
import 'src/config/scroll_config.dart';
import 'src/core/constants.dart';

void main() {
  setPathUrlStrategy();

  AppRouter.defineRoute();

  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: projectName,
      theme: AppTheme.appTheme,
      scrollBehavior: CustomScrollConfig(),
      onGenerateRoute: AppRouter.appRouter.generator,
      initialRoute: '/',
    );
  }
}
