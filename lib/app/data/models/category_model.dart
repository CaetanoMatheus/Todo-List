import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/app/data/models/todo_model.dart';
import 'package:todo_list/app/domain/entities/category.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Category {
  CategoryModel(int id, String name, String color, [List<TodoModel> todos])
      : super(id, name, color, todos);

  factory CategoryModel.fromParent(Category parent) {
    return CategoryModel(parent.id, parent.name, parent.color, parent.todos);
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  List<TodoModel> get todos => super.todos;
}
