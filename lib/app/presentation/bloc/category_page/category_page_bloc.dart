import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_list/app/domain/entities/category.dart';
import 'package:todo_list/app/domain/repositories/i_category_repository.dart';
import 'package:todo_list/constants/colors_hex.dart';
import 'package:todo_list/router/routes.dart';

enum CategoryPageAction { create, update }

class CategoryPageBloc {
  // ignore: close_sinks
  final StreamController _streamController = StreamController.broadcast();
  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  final ICategoryRepository repository;
  final formKey = GlobalKey<FormState>();

  Category category;
  CategoryPageAction pageAction;

  CategoryPageBloc(this.repository);

  Future<void> call(int id) async {
    if (id == null) {
      this.pageAction = CategoryPageAction.create;
      this.category = Category(null, '', ColorsHex.codes[0]);
    } else {
      this.pageAction = CategoryPageAction.update;
      this.category = await this.repository.find(id);
    }
    this.updateScreen(this.pageAction);
    this.updateScreen(this.category);
  }

  Future<void> deleteCategory(BuildContext context) async {
    await this.repository.delete(this.category.id);
    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (_) => false);
  }

  Future<void> handleCategory(BuildContext context) async {
    if (!this.saveForm()) return null;
    this.pageAction == CategoryPageAction.create
        ? await this.repository.create(this.category)
        : await this.repository.update(this.category);
    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (_) => false);
  }

  void setColor(String color) {
    this.category.color = color;
    this.updateScreen(this.category);
  }

  bool saveForm() {
    final form = this.formKey.currentState;
    if (!form.validate()) return false;
    form.save();
    return true;
  }

  String validateInput(String value) {
    return value.isEmpty ? 'Hey, don\'t forget the category title' : null;
  }

  void updateScreen(data) => this.input.add(data);
}
