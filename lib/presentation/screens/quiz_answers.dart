import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import '../../data/models/question.dart';
import '../widgets/custom_app_bar.dart';

class AnswersScreen extends StatelessWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  const AnswersScreen(
      {Key? key, required this.questions, required this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomCurvedAppBar(title: 'Answers'),
      backgroundColor: const Color(0xFF5AC8FA),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: questions.length + 1,
            itemBuilder: _buildItem,
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == questions.length) {
      return ElevatedButton(
        child: const Text("Done"),
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      );
    }
    Question question = questions[index];
    bool correct = question.correctAnswer == answers[index];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              HtmlUnescape().convert(question.question!),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
            const SizedBox(height: 5.0),
            Text(
              HtmlUnescape().convert("${answers[index]}"),
              style: TextStyle(
                  color: correct ? Colors.green : Colors.red,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5.0),
            correct
                ? Container()
                : Text.rich(
                    TextSpan(children: [
                      const TextSpan(text: "Answer: "),
                      TextSpan(
                          text: HtmlUnescape().convert(question.correctAnswer!),
                          style: const TextStyle(fontWeight: FontWeight.w500))
                    ]),
                    style: const TextStyle(fontSize: 16.0),
                  )
          ],
        ),
      ),
    );
  }
}
