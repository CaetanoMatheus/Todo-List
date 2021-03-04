import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/app/data/models/category_model.dart';
import 'package:todo_list/app/domain/entities/todo.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends Todo {
  TodoModel(int id, String title, CategoryModel category, [bool done])
      : super(id, title, category, done);

  factory TodoModel.fromParent(Todo todo) {
    return TodoModel(todo.id, todo.title, todo.category);
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return _$TodoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  @override
  CategoryModel get category => super.category;
}
