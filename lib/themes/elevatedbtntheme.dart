import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.redAccent.shade100,
      onPrimary: Colors.white,
      textStyle: const TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
        fontSize: 22.0,
        letterSpacing: 1.5,
      ),
      minimumSize: const Size(300.0, 65),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.elliptical(16, 24)),
      ),
      elevation: 0.0,
    ),
  );
}
