import 'package:evently_c17/ui/screens/login/login_screen.dart';
import 'package:evently_c17/ui/screens/navigation/navigation_screen.dart';
import 'package:evently_c17/ui/screens/onboarding_screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Onboarding.id:(context) => Onboarding(),
        "Login" :(context) => LoginScreen(),
      },
      initialRoute: Onboarding.id,
      debugShowCheckedModeBanner: false,
      home:  Onboarding(),
     // home: NavigationScreen(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale('en'),
    );
  }
}
