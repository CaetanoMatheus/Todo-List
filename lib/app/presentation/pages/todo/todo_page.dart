import 'package:flutter/material.dart';
import 'package:todo_list/app/presentation/bloc/todo_page/todo_page_bloc.dart';

import 'package:todo_list/app/presentation/pages/todo/styles.dart';
import 'package:todo_list/app/presentation/pages/todo/widgets/todo_bar/todo_bar.dart';
import 'package:todo_list/app/presentation/widgets/button/glowing_button/glowing_button.dart';
import 'package:todo_list/app/presentation/widgets/input/input/input.dart';
import 'package:todo_list/injection_container.dart' as ic;

class TodoPage extends StatelessWidget with TodoPageStyles {
  final int todoId;
  final int categoryId;
  final controller = ic.get<TodoPageBloc>();

  TodoPage({Key key, this.todoId, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller(todoId, categoryId),
      builder: (_, snapshot) {
        return snapshot.connectionState != ConnectionState.done
            ? Scaffold(body: Center(child: CircularProgressIndicator()))
            : buildPage(context);
      },
    );
  }

  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: TodoAppBar(controller: controller),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: inputContainerPadding(context),
                  child: Form(
                    key: controller.formKey,
                    child: Input(
                      hint: 'Enter the task title',
                      initialValue: controller.todo?.title,
                      validator: controller.validateInput,
                      onSaved: (value) => controller.todo.title = value,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GlowingButton(
              height: 70,
              margin: glowingButtonMargin(),
              child: Text(
                controller.pageAction == TodoPageAction.create
                    ? 'Create Task'
                    : 'Update Task',
                style: glowingButtonMarginTextStyle(),
              ),
              onTap: () => controller.handleTodo(context),
            ),
          ),
        ],
      ),
    );
  }
}
