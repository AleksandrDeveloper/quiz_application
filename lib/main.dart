import 'package:flutter/material.dart';

import 'configs/configs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRoute = AppRoute();
    return MaterialApp(
      title: 'Quiz Application',
      debugShowCheckedModeBanner: false,
      theme: mainTheme(),
      routes: appRoute.routes,
      initialRoute: appRoute.initialRoutes,
    );
  }
}
