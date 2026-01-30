import 'package:evently_c17/ui/screens/add_event/add_event_screen.dart';
import 'package:evently_c17/ui/screens/login/login_screen.dart';
import 'package:evently_c17/ui/screens/navigation/navigation_screen.dart';
import 'package:evently_c17/ui/screens/onboarding_screen/onboarding.dart';
import 'package:flutter/material.dart';
import '../screens/register/register_sceen.dart';

abstract final class AppRoutes {
  static MaterialPageRoute get onboarding =>
      MaterialPageRoute(builder: (_) => Onboarding());

  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  static MaterialPageRoute get register =>
      MaterialPageRoute(builder: (_) => RegisterScreen());

  static MaterialPageRoute get navigation =>
      MaterialPageRoute(builder: (_) => NavigationScreen());

  static MaterialPageRoute get addEvent =>
      MaterialPageRoute(builder: (_) => AddEventScreen());
}
