import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/app/data/models/category.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  int _id;
  String _title;
  bool _done;
  Category _category;

  Todo(int id, String title, Category category, [bool done]) {
    this.id = id;
    this.title = title;
    this.done = done;
    this.category = category;
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  int get id => this._id;
  String get title => this._title;
  bool get done => this._done;
  Category get category => this._category;

  set id(int id) => this._id = id;
  set title(String title) => this._title = title;
  set done(bool done) => this._done = done ?? false;
  set category(Category category) {
    this._category = category;
    category?.addTodo(this);
  }
}
