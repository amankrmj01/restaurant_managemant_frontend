import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  final IconData icon;
  final String text;

  Category({required this.icon, required this.text});
}

final List<Category> categories = [
  Category(icon: FontAwesomeIcons.pizzaSlice, text: "Italian"),
  Category(icon: FontAwesomeIcons.spoon, text: "Asian"),
  Category(icon: FontAwesomeIcons.martiniGlassEmpty, text: "Bars"),
  Category(icon: FontAwesomeIcons.burger, text: "Burgers"),
  Category(icon: FontAwesomeIcons.mugHot, text: "Cafe"),
  Category(icon: FontAwesomeIcons.beerMugEmpty, text: "Pubs"),
  Category(icon: FontAwesomeIcons.seedling, text: "Vegan"),
  Category(icon: FontAwesomeIcons.fish, text: "Seafood"),
];
