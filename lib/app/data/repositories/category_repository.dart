import 'package:todo_list/app/data/datasources/contracts/i_category_data_source.dart';
import 'package:todo_list/app/data/models/category_model.dart';
import 'package:todo_list/app/domain/entities/category.dart';
import 'package:todo_list/app/domain/entities/todo.dart';
import 'package:todo_list/app/domain/repositories/i_category_repository.dart';

class CategoryRepository implements ICategoryRepository {
  ICategoryDataSource _datasource;

  CategoryRepository(ICategoryDataSource datasource) {
    this._datasource = datasource;
  }

  @override
  Future<List<Category>> all() => this._datasource.all();

  @override
  Future<Category> find(int id) => this._datasource.find(id);

  @override
  Future<Category> create(Category category) {
    return this._datasource.create(CategoryModel.fromParent(category));
  }

  @override
  Future<bool> update(Category category) {
    return this._datasource.update(category);
  }

  @override
  Future<bool> delete(int id) => this._datasource.delete(id);

  @override
  Future<Category> findByTodo(Todo todo) => this._datasource.findByTodo(todo);
}
