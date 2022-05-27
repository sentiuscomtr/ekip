import 'package:flutter/material.dart';
import 'package:new_project1/constants/colors.dart';

class ElevatedButtonThemes {
  static ButtonStyle greenStyle(double width, double height, bool enabled) {
    return ElevatedButton.styleFrom(
        primary: enabled ? green : grey,
        minimumSize: Size(width, height),
        maximumSize: Size(width + 1, height + 1));
  }

  static ButtonStyle redStyle() {
    return ElevatedButton.styleFrom(primary: red);
  }

  static ButtonStyle amberStyle() {
    return ElevatedButton.styleFrom(primary: yellow);
  }

  static ButtonStyle loginButtonStyle(double width, double height) {
    return ElevatedButton.styleFrom(
        primary: Colors.white, minimumSize: Size(width, height));
  }
}
