// quiz_options_cubit.dart

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/models/category.dart';
import '../../data/models/question.dart';
import '../../data/repositories/quiz_repository.dart';

part 'quiz_options_state.dart';

class QuizOptionsCubit extends Cubit<QuizOptionsState> {
  final QuizRepository _quizRepository = QuizRepository();

  QuizOptionsCubit() : super(QuizOptionsInitial());

  Future<void> fetchQuestions(
      Category category, int? total, String? difficulty) async {
    emit(QuizOptionsLoading());
    //print('total $total  dif $difficulty');
    try {
      final List<Question> questions =
          await _quizRepository.getQuestions(category, total, difficulty);
      emit(QuizOptionsLoaded(questions: questions));
    } on DioException catch (error) {
      emit(QuizOptionsError(errorMessage: error.message!));
    } catch (error) {
      emit(const QuizOptionsError(
          errorMessage: 'An unexpected error occurred.'));
    }
  }
}
