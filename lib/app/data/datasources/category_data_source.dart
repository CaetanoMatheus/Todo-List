import 'package:todo_list/app/data/datasources/contracts/i_category_data_source.dart';
import 'package:todo_list/app/data/models/category.dart';
import 'package:todo_list/app/data/models/todo.dart';
import 'package:todo_list/external/sqflite/query_service.dart';

class CategoryDataSource implements ICategoryDataSource {
  final String _tableName = 'categories';
  final List<String> _removeOnPersist = ['todos'];

  QueryService _service;

  CategoryDataSource(QueryService service) {
    this._service = service;
  }

  @override
  Future<List<Category>> all() async {
    final categoriesMaps = await this._service.all(this._tableName);
    return categoriesMaps
        .map((Map category) => Category.fromJson(category))
        .toList();
  }

  @override
  Future<Category> find(int id) async {
    final category = await this._service.find(this._tableName, id);
    return Category.fromJson(category);
  }

  @override
  Future<Category> create(Category category) async {
    category.id = await this._service.create(
          this._tableName,
          this._removeFieldsToPersist(category),
        );
    return category;
  }

  @override
  Future<bool> update(Category category) async {
    final result = await this._service.update(
          this._tableName,
          this._removeFieldsToPersist(category),
        );
    return result > 0;
  }

  @override
  Future<bool> delete(int id) async {
    return await this._service.destroy(this._tableName, id) > 0;
  }

  Map<String, dynamic> _removeFieldsToPersist(Category category) {
    final map = category.toJson();
    this._removeOnPersist.forEach((String key) => map.remove(key));
    return map;
  }

  @override
  Future<Category> findByTodo(Todo todo) async {
    final categoryMaps = await this._service.rawQuery(
      '''
        SELECT * FROM categories WHERE id = (SELECT category_id FROM todos WHERE id = ?)
      ''',
      [todo.id],
    );

    if (categoryMaps.isEmpty) return null;
    return Category.fromJson(categoryMaps.first);
  }
}
