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
    final List args = settings.arguments;

    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case todo:
        return MaterialPageRoute(
          builder: (_) => TodoPage(
            todoId: _getParam(args, 0),
            categoryId: null,
          ),
        );
      case category:
        return MaterialPageRoute(
          builder: (_) => CategoryPage(categoryId: _getParam(args, 0)),
        );
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }

  static _getParam(List args, int index) {
    if (args == null) return null;
    if (args.length <= index) return null;
    return args[index];
  }
}
