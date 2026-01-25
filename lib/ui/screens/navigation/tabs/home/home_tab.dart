import 'package:evently_c17/firebase_utils/firestore_utility.dart';
import 'package:evently_c17/ui/model/event_dm.dart';
import 'package:evently_c17/ui/model/user_dm.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:evently_c17/ui/utils/constants.dart';
import 'package:evently_c17/ui/widgets/categories_tab_bar.dart';
import 'package:evently_c17/ui/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<EventDM> events = [];
  List<EventDM> filteredEvents = [];
  var selectedCategory = AppConstants.allCategories[0];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildHeader(),
          StreamBuilder(
            stream: getEventsFromFirestore(),
            builder: (context, snapshot) {
              print("snapshot.connectionState = ${snapshot.connectionState}");
              print("snapshot.data = ${snapshot.data}");
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (snapshot.hasData) {
                events = snapshot.data!;
                filterEvents();
                return Expanded(
                  child: Column(
                    children: [
                      buildCategoriesTabBar(),
                      buildEventsList()],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }

  buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Row(
          children: [
            Text("Welcome Back ✨", style: AppTextStyles.grey14Regular),
            Spacer(),
            Icon(Icons.brightness_5, color: AppColors.blue, size: 24),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "En",
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
            ),
          ],
        ),
        Text(
          UserDM.currentUser!.name,
          textAlign: TextAlign.start,
          style: AppTextStyles.black20SemiBold,
        ),
      ],
    );
  }

  buildCategoriesTabBar() {
    return CategoriesTabBar(
      categories: AppConstants.allCategories,
      onChanged: (category) {
        selectedCategory = category;
        setState(() {});
      },
    );
  }

  void filterEvents() {
        if (selectedCategory != AppConstants.all) {
      filteredEvents = events.where((event) {
        return event.categoryDM.name == selectedCategory.name;
      }).toList();
      print(filteredEvents);
    } else {
      filteredEvents = events;
    }
  }

  buildEventsList() {
    print("buildEventsList: ${filteredEvents}");
    return Expanded(
      child: ListView.builder(
        itemCount: filteredEvents.length,
        itemBuilder: (context, index) {
          return EventWidget(eventDM: filteredEvents[index]);
        },
      ),
    );
  }
}
