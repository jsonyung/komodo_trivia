import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});

}

final List<Category> categories = [
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