import 'package:flutter/cupertino.dart';

class EventDM {
  CategoryDM categoryDM;
  String title;
  String description;
  DateTime dateTime;
  bool isFavorite;

  EventDM({
    required this.categoryDM,
    required this.dateTime,
    required this.title,
    required this.description,
    required this.isFavorite,
  });
}

class CategoryDM {
  String name;
  String imagePath;
  IconData icon;

  CategoryDM({required this.name, required this.imagePath, required this.icon});
}

