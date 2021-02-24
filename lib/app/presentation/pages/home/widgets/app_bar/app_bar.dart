import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/app/presentation/providers/theme_provider.dart';
import 'package:todo_list/app/presentation/widgets/button/theme_mode_toggler_button/theme_mode_toggler_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (__, ThemeProvider themeProvider, _) => AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: ThemeModeTogglerButton(
              isDarkMode: themeProvider.isDarkMode,
              onTap: () => themeProvider.toggleThemeMode(),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
