import 'package:flutter/material.dart';

class ThemeApp {

  static final ligthTheme = ThemeData.light().copyWith(
    primaryColor: Colors.black,

    inputDecorationTheme: InputDecorationThemeData(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),

  );

}