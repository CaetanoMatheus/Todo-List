import 'package:todo_list/app/data/datasources/contracts/i_todo_data_source.dart';
import 'package:todo_list/app/domain/entities/todo.dart';
import 'package:todo_list/app/domain/repositories/i_category_repository.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';

class TodoRepository implements ITodoRepository {
  ITodoDataSource _datasource;
  ICategoryRepository _categoryRepository;

  TodoRepository(
      ITodoDataSource datasource, ICategoryRepository categoryRepository) {
    this._datasource = datasource;
    this._categoryRepository = categoryRepository;
  }

  @override
  Future<List<Todo>> all() async {
    final todos = await this._datasource.all();
    for (var todo in todos) {
      todo.category = await this._categoryRepository.findByTodo(todo);
    }
    return todos;
  }

  @override
  Future<Todo> find(int id) => this._datasource.find(id);

  @override
  Future<Todo> create(Todo todo) => this._datasource.create(todo);

  @override
  Future<bool> update(Todo todo) => this._datasource.update(todo);

  @override
  Future<bool> delete(int id) => this._datasource.delete(id);
}
