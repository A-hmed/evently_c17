import 'package:evently_c17/ui/event_dm.dart';
import 'package:evently_c17/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';

abstract final class AppConstants {
  static CategoryDM all = CategoryDM(
    name: "all",
    imagePath: "",
    icon: Icons.border_all_rounded,
  );
  static CategoryDM sports = CategoryDM(
    name: "sports",
    imagePath: AppAssets.sportLight,
    icon: Icons.bike_scooter,
  );
  static CategoryDM bookingClub = CategoryDM(
    name: "bookingClub",
    imagePath: AppAssets.bookClubLight,
    icon: Icons.menu_book,
  );
  static CategoryDM birthday = CategoryDM(
    name: "birthday",
    imagePath: AppAssets.birthdayLight,
    icon: Icons.cake,
  );
  static CategoryDM meeting = CategoryDM(
    name: "meeting",
    imagePath: AppAssets.meetingLight,
    icon: Icons.meeting_room,
  );
  static CategoryDM exhibition = CategoryDM(
    name: "exhibition",
    imagePath: AppAssets.exhibitionLight,
    icon: Icons.access_time_filled_rounded,
  );

  static List<CategoryDM> allCategories = [
    all,
    sports,
    bookingClub,
    birthday,
    meeting,
    exhibition,
  ];
  static List<CategoryDM> customCategories = [
    sports,
    bookingClub,
    birthday,
    meeting,
    exhibition,
  ];
}
