import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../data/models/category.dart';
import '../../data/models/question.dart';
import '../../logic/cubit/quiz_options_cubit.dart';
import '../screens/quiz_screen.dart';

class QuizOptionsDialog extends StatefulWidget {
  final Category? category;

  const QuizOptionsDialog({Key? key, this.category}) : super(key: key);

  @override
  State<QuizOptionsDialog> createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  int? _noOfQuestions;
  String? _difficulty;

  @override
  void initState() {
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "easy";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizOptionsCubit(),
      child: BlocConsumer<QuizOptionsCubit, QuizOptionsState>(
        listener: (context, state) {
          if (state is QuizOptionsError) {
            // Handle error, show error message
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          } else if (state is QuizOptionsLoaded) {
            // Handle loaded state if needed
            final List<Question> questions = state.questions;
            // print(questions.toList().toString());
            if (questions.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuizScreen(
                    questions: questions,
                    category: widget.category,
                  ),
                ),
              );
            } else {
              // Handle case where questions list is empty or null
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("No questions available."),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: MultipleRoundedCurveClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.green,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    height: 60,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AutoSizeText(
                          'Category: ${widget.category!.name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  "Select Total Number of Questions",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                ToggleSwitch(
                  minWidth: 90.0,
                  minHeight: 38,
                  customTextStyles: const [
                    TextStyle(fontWeight: FontWeight.bold)
                  ],
                  initialLabelIndex: _getToggleIndex(_noOfQuestions!),
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey.shade600,
                  inactiveFgColor: Colors.white,
                  activeBgColors: const [
                    [Colors.blue, Colors.green],
                    [Colors.blue, Colors.green],
                    [Colors.blue, Colors.green],
                    [
                      Colors.blue,
                      Colors.green,
                    ],
                    [
                      Colors.blue,
                      Colors.green,
                    ]
                  ],
                  labels: const ['10', '20', '30', '40', '50'],
                  onToggle: (index) {
                    _selectNumberOfQuestions((index! + 1) * 10);
                  },
                ),
                const SizedBox(height: 10.0),
                const Text("Select Difficulty",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 10.0),
                ToggleSwitch(
                    minWidth: 90.0,
                    minHeight: 38,
                    customTextStyles: const [
                      TextStyle(fontWeight: FontWeight.bold)
                    ],
                    initialLabelIndex: _getDifficultyToggleIndex(_difficulty),
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey.shade600,
                    inactiveFgColor: Colors.white,
                    labels: const ['Any', 'Easy', 'Medium', 'Hard'],
                    onToggle: (index) {
                      _selectDifficulty(index!);
                    },
                    activeBgColors: const [
                      [Colors.blue, Colors.green],
                      [Colors.blue, Colors.green],
                      [Colors.blue, Colors.green],
                      [
                        Colors.blue,
                        Colors.green,
                      ]
                    ]),
                const SizedBox(height: 20.0),
                state is QuizOptionsLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 12),
                          backgroundColor: const Color(0xFF006400),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Text(
                          "Start Trivia",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        onPressed: () async {
                          await context.read<QuizOptionsCubit>().fetchQuestions(
                                widget.category!,
                                _noOfQuestions,
                                _difficulty,
                              );

                          // print('a {$_noOfQuestions}   b {$_difficulty}');
                        },
                      ),
                const SizedBox(height: 20.0),
              ],
            ),
          );
        },
      ),
    );
  }

  int _getToggleIndex(int value) {
    return value ~/ 10 - 1;
  }

  int _getDifficultyToggleIndex(String? difficulty) {
    switch (difficulty) {
      case "easy":
        return 1;
      case "medium":
        return 2;
      case "hard":
        return 3;
      default:
        return 0; // Any
    }
  }

  void _selectNumberOfQuestions(int value) {
    setState(() {
      _noOfQuestions = value;
    });
  }

  void _selectDifficulty(int index) {
    switch (index) {
      case 0:
        setState(() {
          _difficulty = null;
        });
        break;
      case 1:
        setState(() {
          _difficulty = "easy";
        });
        break;
      case 2:
        setState(() {
          _difficulty = "medium";
        });
        break;
      case 3:
        setState(() {
          _difficulty = "hard";
        });
        break;
    }
  }
}
