import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EventDM {
  String id;
  String ownerId;
  CategoryDM categoryDM;
  String title;
  String description;
  DateTime dateTime;

  EventDM({
    required this.id,
    required this.ownerId,
    required this.categoryDM,
    required this.dateTime,
    required this.title,
    required this.description,
  });

  static EventDM fromJson(Map<String, dynamic> json) {
    Timestamp timeStamp = json["dateTime"];
    return EventDM(
      id: json["id"],
      ownerId: json["ownerId"],
      categoryDM: CategoryDM.fromJson(json["category"]),
      dateTime: timeStamp.toDate(),
      title: json["title"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "ownerId": ownerId,
      "category": categoryDM.toJson(),
      "title": title,
      "description": description,
      "dateTime": dateTime,
    };
  }
}

class CategoryDM {
  String name;
  String imagePath;
  IconData icon;

  CategoryDM({required this.name, required this.imagePath, required this.icon});

  static CategoryDM fromJson(Map<String, dynamic> json) {
    int codePoint = json["icon"];
    return CategoryDM(
      name: json["name"],
      imagePath: json["imagePath"],
      icon: IconData(codePoint),
    );
  }

  toJson() {
    return {"name": name, "imagePath": imagePath, "icon": icon.codePoint};
  }
}
