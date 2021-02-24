import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/app/presentation/providers/theme_provider.dart';
import 'package:todo_list/router/routes.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Todo List App',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData(),
      initialRoute: Routes.initialRoute,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
