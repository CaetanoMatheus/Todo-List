import 'package:todo_list/app/data/datasources/contracts/i_crud_data_source.dart';
import 'package:todo_list/app/data/models/category.dart';
import 'package:todo_list/app/data/models/todo.dart';

abstract class ICategoryDataSource extends ICrudDataSource<Category> {
  Future<Category> findByTodo(Todo todo);
}
