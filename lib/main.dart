import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/welcome/welcome_bloc.dart';

import 'configs/configs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRoute = AppRoute();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Quiz Application',
        debugShowCheckedModeBanner: false,
        theme: mainTheme(),
        routes: appRoute.routes,
        initialRoute: appRoute.initialRoutes,
      ),
    );
  }
}
