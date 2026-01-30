import 'package:evently_c17/ui/screens/navigation/tabs/favorites/favorites_tab.dart';
import 'package:evently_c17/ui/screens/navigation/tabs/home/home_tab.dart';
import 'package:evently_c17/ui/screens/navigation/tabs/settings/settings_tab.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var selectedIndex = 0;
  var tabs = [HomeTab(), FavoritesTab(), SettingsTab()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: tabs[selectedIndex],
        floatingActionButton: buildFAB(),
        bottomNavigationBar: buildBottomNavigation(),
      ),
    );
  }

  buildFAB() => FloatingActionButton(
    onPressed: () {
      Navigator.push(context, AppRoutes.addEvent);
    },
    backgroundColor: AppColors.blue,
    shape: CircleBorder(),
    child: Icon(Icons.add, color: Colors.white),
  );

  Widget buildBottomNavigation() => Theme(
    data: ThemeData(canvasColor: Colors.white),
    child: BottomNavigationBar(
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.grey2,
      currentIndex: selectedIndex,
      onTap: (newIndex){
        selectedIndex = newIndex;
        setState(() {});
      },
      items: [
        buildBottomNavigationBarItem(Icons.home, "Home"),
        buildBottomNavigationBarItem(Icons.favorite_border, "Favorite"),
        buildBottomNavigationBarItem(Icons.person, "Profile"),
      ],
    ),
  );

  BottomNavigationBarItem buildBottomNavigationBarItem(
    IconData iconData,
    String label,
  ) => BottomNavigationBarItem(icon: Icon(iconData), label: label);
}
