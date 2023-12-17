part of 'quiz_options_cubit.dart';

abstract class QuizOptionsState extends Equatable {
  const QuizOptionsState();

  @override
  List<Object?> get props => [];
}

class QuizOptionsInitial extends QuizOptionsState {}

class QuizOptionsLoading extends QuizOptionsState {}

class QuizOptionsLoaded extends QuizOptionsState {
  final List<Question> questions;

  const QuizOptionsLoaded({required this.questions});

  @override
  List<Object?> get props => [questions];
}

class QuizOptionsError extends QuizOptionsState {
  final String errorMessage;

  const QuizOptionsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
