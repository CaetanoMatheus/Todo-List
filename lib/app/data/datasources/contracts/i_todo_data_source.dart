import 'package:todo_list/app/data/datasources/contracts/i_crud_data_source.dart';
import 'package:todo_list/app/data/models/todo_model.dart';

abstract class ITodoDataSource extends ICrudDataSource<TodoModel> {}
