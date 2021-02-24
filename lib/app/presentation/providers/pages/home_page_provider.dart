import 'package:flutter/cupertino.dart';

import 'package:todo_list/app/data/models/todo_model.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';

class HomePageProvider extends ChangeNotifier {
  ITodoRepository repository;
  List<TodoModel> todos = [];

  HomePageProvider(this.repository);

  Future<void> call() async => await this.getTodos();

  Future<void> getTodos() async {
    this.todos = await this.repository.all();
    this.notifyListeners();
  }

  Future<void> toggleTodoCheck(TodoModel todo) async {
    todo.done = !todo.done;
    await this.repository.update(todo);
    this.notifyListeners();
  }

  Future<void> deleteTodo(TodoModel todo) async {
    this.todos.remove(todo);
    await this.repository.delete(todo.id);
    this.notifyListeners();
  }
}
