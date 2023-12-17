import '../models/category.dart';
import '../models/question.dart';
import '../providers/quiz_api.dart';

class QuizRepository {
  final QuizApi _quizApi = QuizApi();

  Future<List<Question>> getQuestions(
      Category category, int? total, String? difficulty) async {
    try {
      //print('totalrepo $total  difrepo $difficulty');
      return await _quizApi.getQuestions(category, total, difficulty);
    } catch (error) {
      rethrow;
    }
  }
}
