import 'package:todo_list/app/data/datasources/contracts/i_category_data_source.dart';
import 'package:todo_list/app/data/models/category_model.dart';
import 'package:todo_list/app/data/models/todo_model.dart';
import 'package:todo_list/external/sqflite/query_service.dart';

class CategoryDataSource implements ICategoryDataSource {
  final String _tableName = 'categories';
  final List<String> _removeOnPersist = ['todos'];

  QueryService _service;

  CategoryDataSource(QueryService service) {
    this._service = service;
  }

  @override
  Future<List<CategoryModel>> all() async {
    final categoriesMaps = await this._service.all(this._tableName);
    return categoriesMaps
        .map((Map category) => CategoryModel.fromJson(category))
        .toList();
  }

  @override
  Future<CategoryModel> find(int id) async {
    final category = await this._service.find(this._tableName, id);
    return CategoryModel.fromJson(category);
  }

  @override
  Future<CategoryModel> create(CategoryModel category) async {
    category.id = await this._service.create(
          this._tableName,
          this._removeFieldsToPersist(category),
        );
    return category;
  }

  @override
  Future<bool> update(CategoryModel category) async {
    final result = await this._service.update(
          this._tableName,
          this._removeFieldsToPersist(category),
        );
    return result > 0;
  }

  @override
  Future<bool> delete(int id) async {
    bool result = await this._service.destroy(this._tableName, id) > 0;
    if (result) await this._service.destroy('todos', id, 'category_id');
    return result;
  }

  Map<String, dynamic> _removeFieldsToPersist(CategoryModel category) {
    final map = category.toJson();
    this._removeOnPersist.forEach((String key) => map.remove(key));
    return map;
  }

  @override
  Future<CategoryModel> findByTodo(TodoModel todo) async {
    final categoryMaps = await this._service.rawQuery(
      '''
        SELECT * FROM categories WHERE id = (SELECT category_id FROM todos WHERE id = ?)
      ''',
      [todo.id],
    );

    if (categoryMaps.isEmpty) return null;
    return CategoryModel.fromJson(categoryMaps.first);
  }
}
