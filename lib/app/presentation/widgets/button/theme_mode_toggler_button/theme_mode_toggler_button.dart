import 'package:flutter/material.dart';

class ThemeModeTogglerButton extends StatelessWidget {
  final bool isDarkMode;
  final void Function() onTap;

  ThemeModeTogglerButton({
    Key key,
    this.isDarkMode,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isDarkMode ? Icons.wb_sunny : Icons.brightness_4_outlined,
        size: 26,
      ),
      onPressed: onTap,
    );
  }
}
