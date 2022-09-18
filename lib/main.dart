import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_application/bloc/result_bloc/result_bloc.dart';
import 'package:quiz_application/bloc/welcome/welcome_bloc.dart';
import 'configs/configs.dart';
import 'package:firebase_core/firebase_core.dart';

import 'uikit/uikit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRoute = AppRoute();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => QuizBloc()),
        BlocProvider(create: (context) => ResultBloc()),
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
