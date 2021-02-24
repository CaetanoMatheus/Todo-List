import 'package:flutter/cupertino.dart';
import 'package:todo_list/app/data/models/category.dart';

import 'package:todo_list/app/data/models/todo.dart';
import 'package:todo_list/app/domain/repositories/i_category_repository.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';

class HomePageProvider extends ChangeNotifier {
  ICategoryRepository categoryRepository;
  ITodoRepository todoRepository;
  Map<int, int> remainigTodos = {};
  List<Category> categories = [];
  List<Todo> todos = [];

  HomePageProvider(this.categoryRepository, this.todoRepository);

  Future<void> call() async {
    await this.getCategories();
    await this.getTodos();
    this.fillRemainigTodos();
  }

  Future<void> getCategories() async {
    this.categories = await this.categoryRepository.all();
  }

  Future<void> getTodos() async {
    this.todos = await this.todoRepository.all();
  }

  void fillRemainigTodos() {
    this.categories.forEach((category) {
      this.remainigTodos[category.id] = this.calculateRemainigTodos(category);
    });
  }

  int calculateRemainigTodos(Category category) {
    int count = 0;
    this.todos.forEach((todo) {
      if (todo.category.id == category.id) count++;
    });
    return count;
  }

  Future<void> toggleTodoCheck(Todo todo) async {
    todo.done = !todo.done;
    await this.todoRepository.update(todo);
    this.notifyListeners();
  }

  Future<void> deleteCategory(Category category) async {
    await this.categoryRepository.delete(category.id);
    this.categories.remove(category);
    this.notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) async {
    this.todos.remove(todo);
    await this.todoRepository.delete(todo.id);
    this.notifyListeners();
  }
}
