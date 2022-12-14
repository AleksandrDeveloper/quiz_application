import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/welcome/welcome_bloc.dart';
import '../configs/configs.dart';
import '../modals/modals.dart';
import '../uikit/uikit.dart';
import '../widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const padding = 16.0;

    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return state.processState == ProcessState.none ||
                state.processState == ProcessState.error
            ? Scaffold(
                appBar: const QuizAppBar(
                  title: 'Quiz Application',
                  isStart: false,
                  currentStep: 1,
                ),
                backgroundColor: AppColor.background,
                body: FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding),
                    child: ListView(
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
                ),
              )
            : state.processState == ProcessState.fine
                ? const SplashScreen(
                    title: 'Приготовься и УДАЧИ!',
                    image: AppImages.start,
                    navigator: 'quiz',
                  )
                : Container();
      },
    );
  }
}
