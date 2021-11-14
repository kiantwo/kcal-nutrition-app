import 'package:flutter/material.dart';

class Recipe {
  String name;
  String description;
  String subDescription;
  int timeRequired;
  int servingAmt;
  int rating;
  List<Ingredient> ingredients;
  List<String> steps;
  NetworkImage thumbnail;
  bool isFavorited;

  Recipe(
      {required this.name,
      required this.description,
      required this.subDescription,
      required this.timeRequired,
      required this.servingAmt,
      required this.ingredients,
      required this.steps,
      required this.thumbnail,
      required this.rating,
      this.isFavorited = false});
}

class Ingredient {
  String name;
  String measurements;
  AssetImage img;

  Ingredient(
      {required this.name, required this.measurements, required this.img});
}
