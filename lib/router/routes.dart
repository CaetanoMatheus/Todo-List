import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/pages/category/category_page.dart';
import 'package:todo_list/app/presentation/pages/home/home_page.dart';
import 'package:todo_list/app/presentation/pages/todo/todo_page.dart';

abstract class Routes {
  static const String home = '/';
  static const String todo = '/todo';
  static const String category = '/category';

  static const String initialRoute = home;

  static Route generateRoutes(RouteSettings settings) {
    final int args = settings.arguments;

    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case todo:
        return MaterialPageRoute(builder: (_) => TodoPage(todoId: args));
      case category:
        return MaterialPageRoute(
          builder: (_) => CategoryPage(categoryId: args),
        );
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
