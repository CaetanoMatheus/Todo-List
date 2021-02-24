import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/pages/home/home_page.dart';
import 'package:todo_list/app/presentation/pages/todo/todo_page.dart';

abstract class Routes {
  static const String home = '/';
  static const String todo = '/todo';

  static const String initialRoute = home;

  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case todo:
        int todoId = settings.arguments;
        return MaterialPageRoute(builder: (_) => TodoPage(todoId: todoId));
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
