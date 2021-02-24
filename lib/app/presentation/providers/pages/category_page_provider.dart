import 'package:flutter/material.dart';

import 'package:todo_list/app/data/models/category_model.dart';
import 'package:todo_list/app/domain/repositories/i_category_repository.dart';
import 'package:todo_list/constants/colors_hex.dart';

enum CategoryPageAction { create, update }

class CategoryPageProvider extends ChangeNotifier {
  final ICategoryRepository repository;
  final formKey = GlobalKey<FormState>();

  String color = ColorsHex.codes[0];
  CategoryModel category;
  CategoryPageAction pageAction;

  CategoryPageProvider(this.repository);

  Future<void> call(int id) async {
    if (id == null) {
      this.pageAction = CategoryPageAction.create;
      this.category = CategoryModel(null, '', null);
    } else {
      this.pageAction = CategoryPageAction.update;
      this.category = await this.repository.find(id);
      this.color = this.category.color;
    }
  }

  Future<void> deleteCategory(BuildContext context) async {
    await this.repository.delete(this.category.id);
    this.finish(context);
  }

  Future<void> handleCategory(BuildContext context) async {
    if (!this.saveForm()) return null;
    this.pageAction == CategoryPageAction.create
        ? await this.repository.create(this.category)
        : await this.repository.update(this.category);
    this.finish(context);
  }

  void setColor(String color) {
    this.color = color;
    this.notifyListeners();
  }

  bool saveForm() {
    final form = this.formKey.currentState;
    if (!form.validate()) return false;
    form.save();
    this.category.color = this.color;
    return true;
  }

  String validateInput(String value) {
    return value.isEmpty ? 'Hey, don\'t forget the category title' : null;
  }

  void finish(BuildContext context) {
    this.category = CategoryModel(null, '', null);
    this.color = ColorsHex.codes[0];
    Navigator.pop(context);
  }
}
