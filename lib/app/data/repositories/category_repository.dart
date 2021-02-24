import 'package:todo_list/app/data/datasources/contracts/i_category_data_source.dart';
import 'package:todo_list/app/data/models/category_model.dart';
import 'package:todo_list/app/domain/repositories/i_category_repository.dart';

class CategoryRepository implements ICategoryRepository {
  ICategoryDataSource _datasource;

  CategoryRepository(ICategoryDataSource datasource) {
    this._datasource = datasource;
  }

  @override
  Future<List<CategoryModel>> all() => this._datasource.all();

  @override
  Future<CategoryModel> find(int id) => this._datasource.find(id);

  @override
  Future<CategoryModel> create(CategoryModel category) {
    return this._datasource.create(category);
  }

  @override
  Future<bool> update(CategoryModel category) {
    return this._datasource.update(category);
  }

  @override
  Future<bool> delete(int id) => this._datasource.delete(id);
}
