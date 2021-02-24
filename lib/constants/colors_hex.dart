import 'package:flutter/material.dart';

abstract class ColorsHex {
  static List<String> codes = [
    'AA00FF', // purple
    'BA68C8', // lightPurple
    '4A148C', // darkPurple
    '0288D1', // blue
    '4FC3F7', // lightBlue
    '01579B', // darkBlue
    '00C853', // green
    '00E676', // lightGreen
    '1B5E20', // darkGreen
    'FFFF00', // yellow
    'FFEB3B', // lightYellow
    'F9A825', // darkYellow
    'EF6C00', // orange
    'FFA726', // lightOrange
    'E65100', // darkOrange
    'D50000', // red
    'F44336', // lightRed
    'B71C1C', // DarkRed
    'FF46EE', // pink
  ];

  static Color color(String code) {
    return Color(int.parse('0xFF$code'));
  }
}
