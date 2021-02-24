import 'package:todo_list/app/data/datasources/contracts/i_todo_data_source.dart';
import 'package:todo_list/app/data/models/todo_model.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';

class TodoRepository implements ITodoRepository {
  ITodoDataSource _datasource;

  TodoRepository(ITodoDataSource datasource) {
    this._datasource = datasource;
  }

  @override
  Future<List<TodoModel>> all() => this._datasource.all();

  @override
  Future<TodoModel> find(int id) => this._datasource.find(id);

  @override
  Future<TodoModel> create(TodoModel todo) => this._datasource.create(todo);

  @override
  Future<bool> update(TodoModel todo) => this._datasource.update(todo);

  @override
  Future<bool> delete(int id) => this._datasource.delete(id);
}
