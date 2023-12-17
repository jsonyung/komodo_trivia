import 'package:flutter/material.dart';
import 'package:komodo_trivia/presentation/screens/quiz_answers.dart';
import '../../data/models/question.dart';
import '../widgets/custom_app_bar.dart';

class ScorecardScreen extends StatefulWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  const ScorecardScreen(
      {Key? key, required this.questions, required this.answers})
      : super(key: key);

  @override
  State<ScorecardScreen> createState() => _ScorecardScreenState();
}

class _ScorecardScreenState extends State<ScorecardScreen> {
  int? correctAnswers;

  @override
  Widget build(BuildContext context) {
    int correct = 0;
    widget.answers.forEach((index, value) {
      if (widget.questions[index].correctAnswer == value) correct++;
    });
    return Scaffold(
      appBar: const CustomCurvedAppBar(title: 'Scorecard'),
      backgroundColor: const Color(0xFF5AC8FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Congratulations!",
              style: TextStyle(
                fontSize: 26.0,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Image.asset(
              'assets/trophy.png',
              width: 120,
              height: 140,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "You Scored",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${(correct / widget.questions.length * 100).toStringAsFixed(0)} / 100",
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Correct Answers",
                      style: TextStyle(
                        color: Colors.white, // Choose your desired text color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.green, // Choose your desired color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "$correct/${widget.questions.length}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Wrong Answers",
                      style: TextStyle(
                        color: Colors.white, // Choose your desired text color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.red, // Choose your desired color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "${widget.questions.length - correct}/${widget.questions.length}",
                        style: const TextStyle(
                          color: Colors.white, // Choose your desired text color
                          fontSize: 18.0, // Choose your desired font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: const Color(0xFF006400),
                  ),
                  child: const Text("Check Answers"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => AnswersScreen(
                              questions: widget.questions,
                              answers: widget.answers,
                            )));
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Home"),
                  onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
