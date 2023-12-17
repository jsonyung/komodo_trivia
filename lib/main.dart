import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:komodo_trivia/presentation/screens/home_screen.dart';
import 'package:komodo_trivia/presentation/widgets/text_different_color.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Komodo Trivia',
        home: AnimatedSplashScreen(
            duration: 2500,
            splash: const FittedBox(
              child: Column(
                children: [
                  TextWithDifferentColors(),
                  Text('Where Learning Meets Fun!',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ],
              ),
            ),
            nextScreen: HomeScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.blue));
  }
}
