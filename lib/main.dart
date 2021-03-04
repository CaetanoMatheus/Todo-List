import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todo_list/app/data/models/category_model.dart';
import 'package:todo_list/app/data/models/todo_model.dart';
import 'package:todo_list/app/domain/repositories/i_category_repository.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';
import 'package:todo_list/app/presentation/providers/theme_provider.dart';
import 'package:todo_list/external/sqflite/database_service.dart';
import 'package:todo_list/todo_list.dart';
import 'package:todo_list/injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.initDepencies();

  // DatabaseService service = DatabaseService.instance;
  // await service.destroyDatabase();

  // final category1 = Category(null, 'School', 'AA00FF');
  // final category2 = Category(null, 'Work', '00C853');
  // final category3 = Category(null, 'Family', 'EF6C00');

  // final categoryRepository = ic.get<ICategoryRepository>();
  // await categoryRepository.create(category1);
  // await categoryRepository.create(category2);
  // await categoryRepository.create(category3);

  // final categories = await categoryRepository.all();
  // print('<${categories.length}> => $categories');

  // final todo1 = Todo(null, 'Pass math exam', category1);
  // final todo2 = Todo(null, 'Go to my afternoon meeting', category2);
  // final todo3 = Todo(null, 'Fire James', category2);
  // final todo4 = Todo(null, 'Hire James wife', category2);
  // final todo5 = Todo(null, 'Pay with kids', category3);
  // final todo6 = Todo(null, 'Kiss my mom', category3);

  // final todoRepository = ic.get<ITodoRepository>();
  // await todoRepository.create(todo1);
  // await todoRepository.create(todo2);
  // await todoRepository.create(todo3);
  // await todoRepository.create(todo4);
  // await todoRepository.create(todo5);
  // await todoRepository.create(todo6);

  // final todos = await todoRepository.all();
  // print('<${todos.length}> => $todos');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(create: (_) {
      return ThemeProvider.instance(ic.get<SharedPreferences>());
    })
  ], child: TodoList()));
}
