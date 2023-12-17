
import 'package:flutter/material.dart';

class TextWithDifferentColors extends StatelessWidget {
  const TextWithDifferentColors({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'K',
        style: TextStyle(
          fontSize: 40,
          color: Colors.green,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.4),
              offset: const Offset(-3, 3),
              blurRadius: 4,
            ),
          ],
        ),
        children: [
          TextSpan(
            text: 'O',
            style: TextStyle(
              fontSize: 40,
              color: Colors.pink,
            ),
          ),
          TextSpan(
            text: 'M',
            style: TextStyle(
              fontSize: 40,
              color: Colors.red,
            ),
          ),
          TextSpan(
            text: 'O',
            style: TextStyle(
              fontSize: 40,
              color: Colors.orange,
            ),
          ),
          TextSpan(
            text: 'D',
            style: TextStyle(
              fontSize: 40,
              color: Colors.purple,
            ),
          ),
          TextSpan(
            text: 'O',
            style: TextStyle(
              fontSize: 40,
              color: Colors.yellow,
            ),
          ),
          TextSpan(
            text: ' ',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          TextSpan(
            text: 'T',
            style: TextStyle(
              fontSize: 40,
              color: Colors.teal,
            ),
          ),
          TextSpan(
            text: 'R',
            style: TextStyle(
              fontSize: 40,
              color: Colors.indigo,
            ),
          ),
          TextSpan(
            text: 'I',
            style: TextStyle(
              fontSize: 40,
              color: Colors.lightBlue,
            ),
          ),
          TextSpan(
            text: 'V',
            style: TextStyle(
              fontSize: 40,
              color: Colors.cyan,
            ),
          ),
          TextSpan(
            text: 'I',
            style: TextStyle(
              fontSize: 40,
              color: Colors.deepOrange,
            ),
          ),
          TextSpan(
            text: 'A',
            style: TextStyle(
              fontSize: 40,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}