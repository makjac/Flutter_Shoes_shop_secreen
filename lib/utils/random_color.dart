import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RandomColor {
  static final List<Color> colors = [
    const Color.fromARGB(95, 86, 154, 18),
    const Color.fromARGB(95, 164, 105, 3),
    const Color.fromARGB(95, 12, 127, 145),
    const Color.fromARGB(95, 153, 8, 133),
    const Color.fromARGB(95, 99, 129, 8),
    const Color.fromARGB(95, 69, 38, 141),
    const Color.fromARGB(95, 7, 163, 103),
    const Color.fromARGB(95, 170, 8, 111),
    const Color.fromARGB(95, 168, 183, 6),
  ];

  static Color listRandom() {
    Random random = Random();
    int index = random.nextInt(colors.length);
    Color tempcol = colors[index];
    return tempcol;
  }

  static Color random() {
    Random random = Random();
    Color tempcol = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    return tempcol;
  }
}
