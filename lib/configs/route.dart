import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoute{
  Map<String, Widget Function(BuildContext)> routes = {
    'welcome': ((context) => const WelcomeScreen()),
    'quiz': ((context) => const QuizScreen()),
    'result': (context) {
      return const ResultScreen();
    },

  };
  final String initialRoutes = 'welcome';
}
