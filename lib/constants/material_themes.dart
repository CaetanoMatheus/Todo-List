import 'package:flutter/material.dart';

import 'package:todo_list/constants/colors.dart';

abstract class MaterialThemes {
  static AppBarTheme appBarTheme() {
    return AppBarTheme(
      color: TLColors.color(TLColors.background),
      elevation: 0,
      iconTheme: IconThemeData(color: TLColors.color(TLColors.label)),
      actionsIconTheme: IconThemeData(color: TLColors.color(TLColors.label)),
    );
  }

  static FloatingActionButtonThemeData floatingActionButtonTheme() {
    return FloatingActionButtonThemeData(
      backgroundColor: TLColors.color(TLColors.primary),
    );
  }

  static MaterialColor scaffoldBackgroundColor() {
    return TLColors.color(TLColors.background);
  }
}
