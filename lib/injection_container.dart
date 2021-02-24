import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todo_list/app/data/datasources/contracts/i_todo_data_source.dart';
import 'package:todo_list/app/data/datasources/todo_data_source.dart';
import 'package:todo_list/app/data/repositories/todo_repository.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';
import 'package:todo_list/app/presentation/providers/pages/home_page_provider.dart';
import 'package:todo_list/app/presentation/providers/pages/todo_page_provider.dart';
import 'package:todo_list/app/presentation/providers/theme_provider.dart';
import 'package:todo_list/external/sqflite/query_service.dart';

final GetIt _getIt = GetIt.instance;

get<T>() {
  return _getIt<T>();
}

Future<void> initDepencies() async {
  //! Domain|Data - Repositories
  _getIt.registerFactory<ITodoRepository>(() => TodoRepository(_getIt()));

  //! Data - Data Sources
  _getIt.registerLazySingleton<ITodoDataSource>(() => TodoDataSource(_getIt()));

  //! External
  _getIt.registerLazySingleton<QueryService>(() => QueryService());

  final prefs = await SharedPreferences.getInstance();
  _getIt.registerSingleton<SharedPreferences>(prefs);
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ThemeProvider>(create: (_) {
    return ThemeProvider.instance(get<SharedPreferences>());
  }),
  ChangeNotifierProvider<HomePageProvider>(create: (_) {
    return HomePageProvider(get<ITodoRepository>());
  }),
  ChangeNotifierProvider<TodoPageProvider>(create: (_) {
    return TodoPageProvider(get<ITodoRepository>());
  }),
];
