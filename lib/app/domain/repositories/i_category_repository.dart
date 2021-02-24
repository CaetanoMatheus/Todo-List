import 'package:todo_list/app/data/models/category_model.dart';
import 'package:todo_list/app/domain/repositories/i_crud_repository.dart';

abstract class ICategoryRepository extends ICrudRepository<CategoryModel> {}
