import 'dart:math';

import 'package:flutter/material.dart' show Color;

abstract class UtilsColors{
  
  static Color colorFromUserId(int number) {
    final random = Random(number); // semilla = número
    return Color.fromARGB(
      100, // opacidad siempre al máximo
      random.nextInt(256), // R
      random.nextInt(256), // G
      random.nextInt(256), // B
    );
  }
}