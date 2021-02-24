import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/providers/theme_provider.dart';

abstract class TLColors {
  static const String primary = 'primary';
  static const String label = 'label';
  static const String text = 'text';
  static const String background = 'background';
  static const String background2 = 'background2';
  static const String background3 = 'background3';

  static MaterialColor color(String color) {
    switch (color) {
      case primary:
        return _handleColor(
          dark: MaterialColor(
            0xFFFF46EE,
            const <int, Color>{
              50: const Color(0xFFFF46EE),
              100: const Color(0xFFFF46EE),
              200: const Color(0xFFFF46EE),
              300: const Color(0xFFFF46EE),
              400: const Color(0xFFFF46EE),
              500: const Color(0xFFFF46EE),
              600: const Color(0xFFFF46EE),
              700: const Color(0xFFFF46EE),
              800: const Color(0xFFFF46EE),
              900: const Color(0xFFFF46EE),
            },
          ),
          light: MaterialColor(
            0xFF6171FF,
            const <int, Color>{
              50: const Color(0xFF6171FF),
              100: const Color(0xFF6171FF),
              200: const Color(0xFF6171FF),
              300: const Color(0xFF6171FF),
              400: const Color(0xFF6171FF),
              500: const Color(0xFF6171FF),
              600: const Color(0xFF6171FF),
              700: const Color(0xFF6171FF),
              800: const Color(0xFF6171FF),
              900: const Color(0xFF6171FF),
            },
          ),
        );
      case label:
        return _handleColor(
          dark: MaterialColor(
            0xFF97B4FF,
            const <int, Color>{
              50: const Color(0xFF97B4FF),
              100: const Color(0xFF97B4FF),
              200: const Color(0xFF97B4FF),
              300: const Color(0xFF97B4FF),
              400: const Color(0xFF97B4FF),
              500: const Color(0xFF97B4FF),
              600: const Color(0xFF97B4FF),
              700: const Color(0xFF97B4FF),
              800: const Color(0xFF97B4FF),
              900: const Color(0xFF97B4FF),
            },
          ),
          light: MaterialColor(
            0xFF9AA7CE,
            const <int, Color>{
              50: const Color(0xFF9AA7CE),
              100: const Color(0xFF9AA7CE),
              200: const Color(0xFF9AA7CE),
              300: const Color(0xFF9AA7CE),
              400: const Color(0xFF9AA7CE),
              500: const Color(0xFF9AA7CE),
              600: const Color(0xFF9AA7CE),
              700: const Color(0xFF9AA7CE),
              800: const Color(0xFF9AA7CE),
              900: const Color(0xFF9AA7CE),
            },
          ),
        );
      case text:
        return _handleColor(
          dark: MaterialColor(
            0xFFFFFFFF,
            const <int, Color>{
              50: const Color(0xFFFFFFFF),
              100: const Color(0xFFFFFFFF),
              200: const Color(0xFFFFFFFF),
              300: const Color(0xFFFFFFFF),
              400: const Color(0xFFFFFFFF),
              500: const Color(0xFFFFFFFF),
              600: const Color(0xFFFFFFFF),
              700: const Color(0xFFFFFFFF),
              800: const Color(0xFFFFFFFF),
              900: const Color(0xFFFFFFFF),
            },
          ),
          light: MaterialColor(
            0xFF2C3550,
            const <int, Color>{
              50: const Color(0xFF2C3550),
              100: const Color(0xFF2C3550),
              200: const Color(0xFF2C3550),
              300: const Color(0xFF2C3550),
              400: const Color(0xFF2C3550),
              500: const Color(0xFF2C3550),
              600: const Color(0xFF2C3550),
              700: const Color(0xFF2C3550),
              800: const Color(0xFF2C3550),
              900: const Color(0xFF2C3550),
            },
          ),
        );
      case background:
        return _handleColor(
          dark: MaterialColor(
            0xFF204698,
            const <int, Color>{
              50: const Color(0xFF204698),
              100: const Color(0xFF204698),
              200: const Color(0xFF204698),
              300: const Color(0xFF204698),
              400: const Color(0xFF204698),
              500: const Color(0xFF204698),
              600: const Color(0xFF204698),
              700: const Color(0xFF204698),
              800: const Color(0xFF204698),
              900: const Color(0xFF204698),
            },
          ),
          light: MaterialColor(
            0xFFFFFFFF,
            const <int, Color>{
              50: const Color(0xFFFFFFFF),
              100: const Color(0xFFFFFFFF),
              200: const Color(0xFFFFFFFF),
              300: const Color(0xFFFFFFFF),
              400: const Color(0xFFFFFFFF),
              500: const Color(0xFFFFFFFF),
              600: const Color(0xFFFFFFFF),
              700: const Color(0xFFFFFFFF),
              800: const Color(0xFFFFFFFF),
              900: const Color(0xFFFFFFFF),
            },
          ),
        );
      case background2:
        return _handleColor(
          dark: MaterialColor(
            0xFF244091,
            const <int, Color>{
              50: const Color(0xFF244091),
              100: const Color(0xFF244091),
              200: const Color(0xFF244091),
              300: const Color(0xFF244091),
              400: const Color(0xFF244091),
              500: const Color(0xFF244091),
              600: const Color(0xFF244091),
              700: const Color(0xFF244091),
              800: const Color(0xFF244091),
              900: const Color(0xFF244091),
            },
          ),
          light: MaterialColor(
            0xFF8995B5,
            const <int, Color>{
              50: const Color(0xFF8995B5),
              100: const Color(0xFF8995B5),
              200: const Color(0xFF8995B5),
              300: const Color(0xFF8995B5),
              400: const Color(0xFF8995B5),
              500: const Color(0xFF8995B5),
              600: const Color(0xFF8995B5),
              700: const Color(0xFF8995B5),
              800: const Color(0xFF8995B5),
              900: const Color(0xFF8995B5),
            },
          ),
        );
      case background3:
        return _handleColor(
          dark: MaterialColor(
            0xFF041955,
            const <int, Color>{
              50: const Color(0xFF041955),
              100: const Color(0xFF041955),
              200: const Color(0xFF041955),
              300: const Color(0xFF041955),
              400: const Color(0xFF041955),
              500: const Color(0xFF041955),
              600: const Color(0xFF041955),
              700: const Color(0xFF041955),
              800: const Color(0xFF041955),
              900: const Color(0xFF041955),
            },
          ),
          light: MaterialColor(
            0xFFF5F6FD,
            const <int, Color>{
              50: const Color(0xFFF5F6FD),
              100: const Color(0xFFF5F6FD),
              200: const Color(0xFFF5F6FD),
              300: const Color(0xFFF5F6FD),
              400: const Color(0xFFF5F6FD),
              500: const Color(0xFFF5F6FD),
              600: const Color(0xFFF5F6FD),
              700: const Color(0xFFF5F6FD),
              800: const Color(0xFFF5F6FD),
              900: const Color(0xFFF5F6FD),
            },
          ),
        );
      default:
        return MaterialColor(
          0xFFFFFFFF,
          const <int, Color>{
            50: const Color(0xFFFFFFFF),
            100: const Color(0xFFFFFFFF),
            200: const Color(0xFFFFFFFF),
            300: const Color(0xFFFFFFFF),
            400: const Color(0xFFFFFFFF),
            500: const Color(0xFFFFFFFF),
            600: const Color(0xFFFFFFFF),
            700: const Color(0xFFFFFFFF),
            800: const Color(0xFFFFFFFF),
            900: const Color(0xFFFFFFFF),
          },
        );
    }
  }

  static MaterialColor _handleColor({MaterialColor dark, MaterialColor light}) {
    return ThemeProvider.instance().isDarkMode ? dark : light;
  }
}
