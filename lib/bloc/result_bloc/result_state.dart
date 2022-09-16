part of 'result_bloc.dart';

class ResultState extends Equatable {
  final List<ResultUser> listResult;
  final bool isEnd;

  const ResultState({
    this.listResult = const [],
    this.isEnd = false,
  });
  ResultState copyWith({
    List<ResultUser>? listResult,
    bool? isEnd,
  }) {
    return ResultState(
      listResult: listResult ?? this.listResult,
      isEnd: isEnd ?? this.isEnd,
    );
  }

  @override
  List<Object> get props => [
        listResult,
        isEnd,
      ];
}
