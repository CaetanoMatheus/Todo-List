import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/app/data/models/todo_model.dart';
import 'package:todo_list/app/domain/entities/category.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Category {
  CategoryModel(
    int id,
    String name,
    String color, [
    List<TodoModel> todos,
  ]) : super(id, name, color, todos);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  List<TodoModel> get todos => super.todos;
}
