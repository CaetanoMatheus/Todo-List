import 'dart:convert';

import 'package:todo_list/app/domain/entities/category.dart';
import 'package:todo_list/app/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel(int id, String title, Category category, [bool done])
      : super(id, title, category, done);

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(map['id'], map['title'], map['done']);
  }

  factory TodoModel.fromJson(String jsonString) {
    return TodoModel.fromMap(json.decode(jsonString));
  }

  Map<String, dynamic> toMap() {
    return {'id': this.id, 'title': this.title, 'done': this.done};
  }

  String toJson() {
    return json.encode({'id': this.id, 'title': this.title, 'done': this.done});
  }
}
