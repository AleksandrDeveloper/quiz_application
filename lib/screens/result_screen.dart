import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/bloc/result_bloc/result_bloc.dart';
import 'package:quiz_application/bloc/welcome/welcome_bloc.dart';
import 'package:quiz_application/modals/result_user_modal.dart';
import '../widgets/widgets.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    const padding = 16.0;

    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        final listResult = state.listResult;
        return Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: const AppBarWidget(
            title: 'Quiz Result',
            isStart: false,
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  children: [
                    SizedBox(
                      height: listResult.length * 140,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listResult.length,
                          itemBuilder: (context, index) {
                            final result = listResult[index];
                            return ResultCard(result: result);
                          }),
                    ),
                    Container(
                      width: width,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              'Поехали',
                              style: theme.textTheme.headline5
                                  ?.copyWith(color: theme.shadowColor),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  final bloc = context.read<WelcomeBloc>();
                                  bloc.add(OnStartEvent());
                                  Navigator.of(context).pushNamed('welcome');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


