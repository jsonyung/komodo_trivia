import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:komodo_trivia/data/models/category.dart';
import 'package:komodo_trivia/presentation/screens/home_screen.dart';

void main() {
  testWidgets('HomePage widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Verify that the 'Choose a category and enjoy the trivia!' text is displayed.
    expect(
        find.text('Choose a category and enjoy the trivia!'), findsOneWidget);

    // Assuming you have a list of categories
    List<Category> categories = [
      Category(9, "General Knowledge", icon: FontAwesomeIcons.circleQuestion),
      Category(10, "Books", icon: FontAwesomeIcons.bookOpen),
      Category(11, "Film", icon: FontAwesomeIcons.film),
      Category(12, "Music", icon: FontAwesomeIcons.music),
      Category(13, "Musicals & Theatres", icon: FontAwesomeIcons.masksTheater),
      Category(14, "Television", icon: FontAwesomeIcons.tv),
      Category(15, "Video Games", icon: FontAwesomeIcons.gamepad),
      Category(16, "Board Games", icon: FontAwesomeIcons.dice),
      Category(17, "Science & Nature", icon: FontAwesomeIcons.flask),
      Category(18, "Computer", icon: FontAwesomeIcons.laptop),
      Category(19, "Maths", icon: FontAwesomeIcons.calculator),
      Category(20, "Mythology", icon: FontAwesomeIcons.pagelines),
      Category(21, "Sports", icon: FontAwesomeIcons.football),
      Category(22, "Geography", icon: FontAwesomeIcons.globe),
      Category(23, "History", icon: FontAwesomeIcons.scroll),
      Category(24, "Politics", icon: FontAwesomeIcons.scaleBalanced),
      Category(25, "Art", icon: FontAwesomeIcons.palette),
      Category(26, "Celebrities", icon: FontAwesomeIcons.star),
      Category(27, "Animals", icon: FontAwesomeIcons.paw),
      Category(28, "Vehicles", icon: FontAwesomeIcons.car),
      Category(29, "Comics", icon: FontAwesomeIcons.comments),
      Category(30, "Gadgets", icon: FontAwesomeIcons.mobileScreenButton),
      Category(31, "Japanese Anime & Manga", icon: FontAwesomeIcons.dragon),
      Category(32, "Cartoon & Animation", icon: FontAwesomeIcons.paintbrush),
    ];

    // Verify that the categories are displayed on the screen.
    for (var category in categories) {
      expect(find.text(category.name), findsOneWidget);
    }

    // Tap on the first category and verify that the modal bottom sheet is displayed.
    await tester.tap(find.text(categories[0].name));
    await tester.pump();

    expect(find.text('Category: ${categories[0].name}'), findsOneWidget);
  });
}
