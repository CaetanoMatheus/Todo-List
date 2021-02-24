import 'package:todo_list/app/data/datasources/contracts/i_todo_data_source.dart';
import 'package:todo_list/app/data/models/category.dart';
import 'package:todo_list/app/data/models/todo.dart';
import 'package:todo_list/external/sqflite/query_service.dart';
import 'package:todo_list/utils/type_converter.dart' as converter;

class TodoDataSource implements ITodoDataSource {
  final String _tableName = 'todos';

  QueryService _service;

  TodoDataSource(QueryService service) {
    this._service = service;
  }

  @override
  Future<List<Todo>> all() async {
    final todosMaps = await this._service.all(this._tableName);
    return todosMaps
        .map((todo) => Todo.fromJson(convertFieldToRead(todo)))
        .toList();
  }

  @override
  Future<Todo> find(int id) async {
    final todo = await this._service.find(this._tableName, id);
    return Todo.fromJson(convertFieldToRead(todo));
  }

  @override
  Future<Todo> create(Todo todo) async {
    todo.id =
        await this._service.create(this._tableName, convertFieldToInsert(todo));
    return todo;
  }

  @override
  Future<bool> update(Todo todo) async {
    final result =
        await this._service.update(this._tableName, convertFieldToInsert(todo));
    return result > 0;
  }

  @override
  Future<bool> delete(int id) async {
    return await this._service.destroy(this._tableName, id) > 0;
  }

  static Map<String, dynamic> convertFieldToInsert(Todo todo) {
    Map<String, dynamic> map = {
      ...todo.toJson(),
      'done': converter.boolToInt(todo.done),
      'category_id': todo.category.id
    };
    map.remove('category');
    return map;
  }

  Map<String, dynamic> convertFieldToRead(Map<String, dynamic> todo) {
    return {
      ...todo,
      'done': converter.intToBool(todo['done']),
    };
  }
}
