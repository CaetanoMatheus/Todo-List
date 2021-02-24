import 'package:todo_list/app/data/datasources/todo_data_source.dart';
import 'package:todo_list/app/data/models/category_model.dart';
import 'package:todo_list/app/data/models/todo_model.dart';
import 'package:todo_list/external/sqflite/query_service.dart';
import 'package:todo_list/utils/type_converter.dart' as converter;

import 'contracts/i_category_data_source.dart';

class CategoryDataSource implements ICategoryDataSource {
  final String _tableName = 'categories';
  final String _todosTableName = 'todos';

  QueryService _service;

  CategoryDataSource(QueryService service) {
    this._service = service;
  }

  Future<CategoryModel> allByCategory(CategoryModel category) async {
    final todosMaps = await this
        ._service
        .all(this._todosTableName, 'category_id', category.id);

    todosMaps
        .map((Map todo) => TodoModel.fromJson(
              TodoDataSource.convertFieldToRead(todo),
            ))
        .toList()
        .forEach((TodoModel todo) => category.addTodo(todo));

    return category;
  }

  @override
  Future<List<CategoryModel>> all() async {
    final categoriesMaps = await this._service.all(this._tableName);
    final categoryModels = categoriesMaps
        .map((Map category) => CategoryModel.fromJson(category))
        .toList();

    for (CategoryModel category in categoryModels) {
      category = await this.allByCategory(category);
    }

    return categoryModels;
  }

  @override
  Future<CategoryModel> find(int id) async {
    final category = await this._service.find(this._tableName, id);
    return CategoryModel.fromJson(category);
  }

  @override
  Future<CategoryModel> create(CategoryModel category) async {
    category.id =
        await this._service.create(this._tableName, category.toJson());
    return category;
  }

  @override
  Future<bool> update(CategoryModel category) async {
    final result =
        await this._service.update(this._tableName, category.toJson());
    return result > 0;
  }

  @override
  Future<bool> delete(int id) async {
    return await this._service.destroy(this._tableName, id) > 0;
  }
}
