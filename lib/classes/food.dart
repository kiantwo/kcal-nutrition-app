import 'package:flutter/material.dart';

class Food {
  String name;
  String altName;
  String description;
  AssetImage mainImage;
  List<NetworkImage> gallery;

  Food(
      {required this.name,
      this.altName = '',
      required this.description,
      required this.mainImage,
      required this.gallery});
}
