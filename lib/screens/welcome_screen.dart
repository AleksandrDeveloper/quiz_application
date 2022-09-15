import 'package:flutter/material.dart';
import '../configs/configs.dart';
import '../widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var isStart = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    const padding = 16.0;

    return Scaffold(
      appBar: AppBarWidget(
        title: 'Quiz Application',
        isStart: isStart,
        currentStep: 1,
      ),
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          children: [
            Image(
              image: const AssetImage(
                AppImages.welcome,
              ),
              fit: BoxFit.cover,
              width: width,
            ),
           const FormContainerWelcome()
          ],
        ),
      ),
    );
  }
}
