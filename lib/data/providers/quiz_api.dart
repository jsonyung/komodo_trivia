import 'package:dio/dio.dart';

import '../models/category.dart';
import '../models/question.dart';

class QuizApi {
  static const String baseUrl = "https://opentdb.com/api.php";

  final Dio _dio = Dio();

  Future<List<Question>> getQuestions(
      Category category, int? total, String? difficulty) async {
    //print('totalapi $total  difapi $difficulty');
    var url = "$baseUrl?amount=$total&category=${category.id}";
    if (difficulty != null) {
      url += "&difficulty=$difficulty";
    }

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> questions =
            List<Map<String, dynamic>>.from(response.data["results"]);
        return Question.fromData(questions);
      } else {
        throw response;
      }
    } catch (error) {
      rethrow;
    }
  }
}
