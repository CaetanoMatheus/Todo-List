import 'package:flutter/material.dart';

import 'package:todo_list/app/data/models/todo.dart';
import 'package:todo_list/app/domain/repositories/i_todo_repository.dart';

enum PageAction { create, update }

class TodoPageProvider extends ChangeNotifier {
  final ITodoRepository repository;
  final formKey = GlobalKey<FormState>();

  Todo todo;
  PageAction pageAction;

  TodoPageProvider(this.repository);

  Future<void> call(int id) async {
    if (id == null) {
      this.pageAction = PageAction.create;
      this.todo = Todo(null, '', null);
    } else {
      this.pageAction = PageAction.update;
      this.todo = await this.repository.find(id);
    }
  }

  Future<void> deleteTodo(BuildContext context) async {
    await this.repository.delete(this.todo.id);
    this.finish(context);
  }

  Future<void> handleTodo(BuildContext context) async {
    if (!this.saveForm()) return null;
    this.pageAction == PageAction.create
        ? await this.repository.create(this.todo)
        : await this.repository.update(this.todo);
    this.finish(context);
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

  void finish(BuildContext context) {
    Navigator.pop(context);
  }
}
