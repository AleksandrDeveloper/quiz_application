import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../configs/configs.dart';

class SplashScreen extends StatefulWidget {
  final String image;
  final String title;
  final String navigator;
  const SplashScreen({
    required this.title,
    required this.image,
    required this.navigator,
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed(widget.navigator);
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
            child:   Image(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            ),
          ),
          FadeInUp(
            child: Text(
              widget.title,
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
