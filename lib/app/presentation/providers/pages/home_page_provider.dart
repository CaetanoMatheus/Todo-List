import 'package:flutter/cupertino.dart';
import 'package:todo_list/app/data/models/category.dart';

import 'package:todo_list/app/data/models/todo.dart';
import 'package:todo_list/app/domain/repositories/i_category_repository.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';

class HomePageProvider extends ChangeNotifier {
  ICategoryRepository categoryRepository;
  ITodoRepository todoRepository;
  List<Category> categories = [];
  List<Todo> todos = [];

  HomePageProvider(this.categoryRepository, this.todoRepository);

  Future<void> call() async {
    await this.getCategories();
    await this.getTodos();
  }

  Future<void> getCategories() async {
    this.categories = await this.categoryRepository.all();
  }

  Future<void> getTodos() async {
    this.todos = await this.todoRepository.all();
  }

  Future<void> toggleTodoCheck(Todo todo) async {
    todo.done = !todo.done;
    await this.todoRepository.update(todo);
    this.notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) async {
    this.todos.remove(todo);
    await this.todoRepository.delete(todo.id);
    this.notifyListeners();
  }
}
