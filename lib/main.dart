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
        primaryColor: const Color(0xFFFF9385),
        //Green Color: Color(0xFF7EAD77)
        fontFamily: 'Nunito',
        elevatedButtonTheme: elevatedButtonTheme(),
      ),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Center(
            child: Text(
              'kcal',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 56.0,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                child: Center(
                  child: Text(
                    'ZUAMICA',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 28.0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
