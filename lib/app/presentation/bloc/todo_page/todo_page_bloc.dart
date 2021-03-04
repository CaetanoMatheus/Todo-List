import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_list/app/domain/entities/category.dart';
import 'package:todo_list/app/domain/entities/todo.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';
import 'package:todo_list/router/routes.dart';

enum TodoPageAction { create, update }

class TodoPageBloc {
  // ignore: close_sinks
  final StreamController _streamController = StreamController.broadcast();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  final ITodoRepository repository;
  final formKey = GlobalKey<FormState>();

  Todo todo;
  TodoPageAction pageAction;

  TodoPageBloc(this.repository);

  Future<void> call(int id, int categoryId) async {
    print('ID $categoryId');
    if (id == null) {
      this.pageAction = TodoPageAction.create;
      this.todo = Todo(null, '', Category(categoryId, null, null));
    } else {
      this.pageAction = TodoPageAction.update;
      this.todo = await this.repository.find(id);
      if (categoryId != null)
        this.todo.category = Category(categoryId, null, null);
    }
    print(this.todo.category.id);
    this.updateScreen(this.pageAction);
    this.updateScreen(this.todo);
  }

  Future<void> deleteTodo(BuildContext context) async {
    await this.repository.delete(this.todo.id);
    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (_) => false);
  }

  Future<void> handleTodo(BuildContext context) async {
    if (!this.saveForm()) return null;
    this.pageAction == TodoPageAction.create
        ? await this.repository.create(this.todo)
        : await this.repository.update(this.todo);
    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (_) => false);
  }

  bool saveForm() {
    final form = this.formKey.currentState;
    if (!form.validate()) return false;
    form.save();
    return true;
  }

  String validateInput(String value) {
    return value.isEmpty ? 'Hey, don\'t forget the task title' : null;
  }

  void updateScreen(data) => this.input.add(data);
}
