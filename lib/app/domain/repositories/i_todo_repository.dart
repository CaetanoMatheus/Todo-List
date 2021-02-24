import 'package:todo_list/app/data/models/todo.dart';
import 'package:todo_list/app/domain/repositories/i_crud_repository.dart';

abstract class ITodoRepository extends ICrudRepository<Todo> {}
