import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todo_list/app/data/datasources/category_data_source.dart';
import 'package:todo_list/app/data/datasources/contracts/i_category_data_source.dart';
import 'package:todo_list/app/data/datasources/contracts/i_todo_data_source.dart';
import 'package:todo_list/app/data/datasources/todo_data_source.dart';
import 'package:todo_list/app/data/repositories/category_repository.dart';
import 'package:todo_list/app/data/repositories/todo_repository.dart';
import 'package:todo_list/app/domain/repositories/i_category_repository.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';
import 'package:todo_list/app/presentation/bloc/category_page/category_page_bloc.dart';
import 'package:todo_list/app/presentation/bloc/home_page/home_page_bloc.dart';
import 'package:todo_list/app/presentation/bloc/todo_page/todo_page_bloc.dart';
import 'package:todo_list/external/sqflite/query_service.dart';

final GetIt _getIt = GetIt.instance;

get<T>() => _getIt<T>();

Future<void> initDepencies() async {
  //! Presentation - Bloc
  _getIt.registerFactory<HomePageBloc>(() {
    return HomePageBloc(_getIt(), _getIt());
  });

  _getIt.registerFactory<CategoryPageBloc>(() {
    return CategoryPageBloc(_getIt());
  });

  _getIt.registerFactory<TodoPageBloc>(() {
    return TodoPageBloc(_getIt());
  });

  //! Domain|Data - Repositories
  _getIt.registerFactory<ICategoryRepository>(() {
    return CategoryRepository(_getIt());
  });

  _getIt.registerFactory<ITodoRepository>(() {
    return TodoRepository(_getIt(), _getIt());
  });

  //! Data - Data Sources
  _getIt.registerLazySingleton<ICategoryDataSource>(() {
    return CategoryDataSource(_getIt());
  });

  _getIt.registerLazySingleton<ITodoDataSource>(() {
    return TodoDataSource(_getIt());
  });

  //! External
  _getIt.registerLazySingleton<QueryService>(() => QueryService());

  final prefs = await SharedPreferences.getInstance();
  _getIt.registerSingleton<SharedPreferences>(prefs);
}
