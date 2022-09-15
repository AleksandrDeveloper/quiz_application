import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/welcome/welcome_bloc.dart';
import '../configs/configs.dart';
import '../modals/modals.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

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

    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return state.processState == ProcessState.none ||
                state.processState == ProcessState.error
            ? Scaffold(
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
                ))
            : state.processState == ProcessState.fine
                ? const NextWidget()
                : Container();
      },
    );
  }
}
