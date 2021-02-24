import 'package:todo_list/app/data/datasources/contracts/i_crud_data_source.dart';
import 'package:todo_list/app/data/models/category_model.dart';

abstract class ICategoryDataSource extends ICrudDataSource<CategoryModel> {}
