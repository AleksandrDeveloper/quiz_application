import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('quiz');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
            child: const Image(
              image: AssetImage(AppImages.start),
              fit: BoxFit.cover,
            ),
          ),
          FadeInUp(
            child: Text(
              'Самое время приготовиться, удачи!',
              textAlign: TextAlign.center,
              style: theme.textTheme.headline1
                  ?.copyWith(color: Colors.white, fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
