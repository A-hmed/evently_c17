import 'dart:async';

import 'package:evently_c17/ui/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyCJN23LZPKxy1k-zYBsIHOB2_KppZrr4oo",
        appId: "1:197534563416:android:c30e87c01b53a60c851e2d",
        messagingSenderId: "",
        projectId: "evently-c17-online-920a8"),
  );


  // Future<int> future = Future.value(1);
  // int data = await future;
  // StreamController<int> streamController = StreamController();
  // streamController.add(2);
  // streamController.add(3);
  // streamController.add(4);
  //
  //
  // //////////
  // Stream<int> stream = streamController.stream;
  // stream.listen((newInt){
  //  setState()
  // });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
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
