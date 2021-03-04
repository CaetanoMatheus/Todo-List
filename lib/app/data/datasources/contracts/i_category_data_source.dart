import 'package:todo_list/app/data/datasources/contracts/i_crud_data_source.dart';
import 'package:todo_list/app/data/models/category_model.dart';
import 'package:todo_list/app/data/models/todo_model.dart';

abstract class ICategoryDataSource extends ICrudDataSource<CategoryModel> {
  Future<CategoryModel> findByTodo(TodoModel todo);
}
