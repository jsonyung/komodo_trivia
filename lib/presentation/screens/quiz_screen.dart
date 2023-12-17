import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:html_unescape/html_unescape.dart';
import 'package:komodo_trivia/presentation/screens/scorecard_screen.dart';

import '../../data/models/category.dart';
import '../../data/models/question.dart';
import '../widgets/custom_app_bar.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;
  final Category? category;

  const QuizScreen({Key? key, required this.questions, this.category})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final TextStyle _questionStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final List<Question> _unattemptedQuestions = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final int _duration = 30;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.incorrectAnswers!;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        appBar: CustomCurvedAppBar(title: widget.category!.name),
        backgroundColor: const Color(0xFF5AC8FA),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircularCountDownTimer(
                    duration: _duration,
                    isReverse: true,
                    isReverseAnimation: true,
                    controller: _controller,
                    width: 50,
                    height: 50,
                    ringColor: Colors.grey[300]!,
                    fillColor: Colors.green,
                    strokeWidth: 5.0,
                    textStyle: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    onComplete: () {
                      // Move to the next question and restart the timer
                      _nextQuestion();
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the border radius as needed
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${_currentIndex + 1}/${widget.questions.length}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            HtmlUnescape().convert(
                                widget.questions[_currentIndex].question!),
                            softWrap: true,
                            style: MediaQuery.of(context).size.width > 800
                                ? _questionStyle.copyWith(fontSize: 30.0)
                                : _questionStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            final option = options[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              // Add bottom margin
                              child: ListTile(
                                tileColor: _answers[_currentIndex] == option
                                    ? Colors
                                        .green // Set the background color for the selected option
                                    : Colors.white,
                                // Set the background color for unselected options
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Set rounded corners
                                ),
                                title: Center(
                                  child: Text(
                                    HtmlUnescape().convert("$option"),
                                    style:
                                        MediaQuery.of(context).size.width > 800
                                            ? const TextStyle(fontSize: 30.0)
                                            : null,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    _answers[_currentIndex] = option;
                                  });
                                  Future.delayed(
                                      const Duration(milliseconds: 600), () {
                                    _nextQuestion(); // Move to the next question after the delay
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _nextQuestion() {
    // Mark the current question as unattempted if not answered
    if (_answers[_currentIndex] == null) {
      _answers[_currentIndex] = "unattempted";
      _unattemptedQuestions.add(widget.questions[_currentIndex]);
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
      // Restart the timer for the new question
      _controller.restart(duration: _duration);
    } else {
      // Quiz is finished, remove unattempted questions
      List<Question> attemptedQuestions = [];
      _answers.forEach((index, answer) {
        if (answer != "unattempted") {
          attemptedQuestions.add(widget.questions[index]);
        }
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) =>
              ScorecardScreen(questions: widget.questions, answers: _answers)));
    }
  }

  Future<bool> _onWillPop() async {
    final exitDialog = await showDialog<bool>(
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Set rounded corners
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF5AC8FA), Color(0xFF4CD964)],
                // Replace with your preferred colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0), // Set rounded corners
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Do you really want to exit the quiz? \nYour progress will not be saved.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                      child: const Text(
                        "Yes",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                    ),
                    TextButton(
                      child: const Text(
                        "No",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return exitDialog ?? false;
  }
}
