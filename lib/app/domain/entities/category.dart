import 'package:todo_list/app/domain/entities/todo.dart';

class Category {
  int _id;
  String _name, _color;
  List<Todo> _todos;

  Category(int id, String name, String color, [List<Todo> todos]) {
    this.id = id;
    this.name = name;
    this.color = color;
    this.todos = todos;
  }

  void addTodo(Todo todo) {
    if (this.todos == null)
      this.todos = [todo];
    else if (!this.todos.contains(todo)) this.todos.add(todo);
    if (todo.category != this) todo.category = this;
  }

  int get id => this._id;
  String get name => this._name;
  String get color => this._color;
  List<Todo> get todos => this._todos;

  set id(int id) => this._id = id;
  set name(String name) => this._name = name;
  set color(String color) => this._color = color;
  set todos(List<Todo> todos) {
    this._todos = todos;
    this._todos?.forEach((Todo todo) => todo.category = this);
  }
}
