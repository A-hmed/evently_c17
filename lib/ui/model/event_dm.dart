import 'package:flutter/cupertino.dart';

class EventDM {
  String ownerId;
  CategoryDM categoryDM;
  String title;
  String description;
  DateTime dateTime;

  EventDM({
    required this.ownerId,
    required this.categoryDM,
    required this.dateTime,
    required this.title,
    required this.description,
  });
}

class CategoryDM {
  String name;
  String imagePath;
  IconData icon;

  CategoryDM({required this.name, required this.imagePath, required this.icon});
}

