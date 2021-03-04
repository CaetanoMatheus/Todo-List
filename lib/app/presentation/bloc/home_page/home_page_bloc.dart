import 'dart:async';

import 'package:todo_list/app/domain/entities/category.dart';
import 'package:todo_list/app/domain/entities/todo.dart';
import 'package:todo_list/app/domain/repositories/i_category_repository.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';

class HomePageBloc {
  // ignore: close_sinks
  final StreamController _streamController = StreamController();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  ICategoryRepository categoryRepository;
  ITodoRepository todoRepository;
  Map<int, int> remainigTodos = {};
  List<Category> categories = [];
  List<Todo> todos = [];

  HomePageBloc(this.categoryRepository, this.todoRepository);

  Future<void> call() async {
    await this.getCategories();
    await this.getTodos();
  }

  Future<void> getCategories() async {
    this.categories = await this.categoryRepository.all();
    this.updateScreen(this.categories);
  }

  Future<void> getTodos() async {
    this.todos = await this.todoRepository.all();
    this.updateScreen(this.todos);
    this.fillRemainigTodos();
  }

  void fillRemainigTodos() {
    this.categories.forEach((category) {
      this.remainigTodos[category.id] = this.calculateRemainigTodos(category);
    });
    this.updateScreen(this.remainigTodos);
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
    this.updateScreen(todo);
    await this.todoRepository.update(todo);
  }

  Future<void> deleteCategory(Category category) async {
    await this.categoryRepository.delete(category.id);
    this.categories.remove(category);
    this.getTodos();
    this.updateScreen(this.categories);
  }

  Future<void> deleteTodo(Todo todo) async {
    this.todos.remove(todo);
    await this.todoRepository.delete(todo.id);
    this.updateScreen(this.todos);
    this.fillRemainigTodos();
  }

  void updateScreen(data) => this.input.add(data);
}
