import 'package:flutter/material.dart';
import 'package:kcal_nutrition_app/screens/onboarding/onboarding.dart';
import 'themes/elevatedbtntheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kcal Nutrition App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Nunito',
        elevatedButtonTheme: elevatedButtonTheme(),
      ),
      home: OnBoarding(),
    );
  }
}
