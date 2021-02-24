import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/app/presentation/providers/pages/todo_page_provider.dart';
import 'package:todo_list/app/presentation/pages/todo/styles.dart';
import 'package:todo_list/app/presentation/pages/todo/widgets/app_bar/app_bar.dart';
import 'package:todo_list/app/presentation/widgets/button/glowing_button/glowing_button.dart';
import 'package:todo_list/app/presentation/widgets/input/input/input.dart';

class TodoPage extends StatelessWidget with TodoPageStyles {
  final int todoId;

  const TodoPage({Key key, this.todoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoPageProvider>(
      builder: (__, TodoPageProvider provider, _) => FutureBuilder(
        future: provider(todoId),
        builder: (_, AsyncSnapshot<void> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? buildScaffold(context, provider)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildScaffold(BuildContext context, TodoPageProvider provider) {
    return Scaffold(
      appBar: TodoAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: inputContainerPadding(context),
                  child: Form(
                    key: provider.formKey,
                    child: Input(
                      hint: 'Enter the task title',
                      initialValue: provider.todo.title,
                      validator: provider.validateInput,
                      onSaved: (value) => provider.todo.title = value,
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
                provider.pageAction == PageAction.create
                    ? 'Create Task'
                    : 'Update Task',
                style: glowingButtonMarginTextStyle(),
              ),
              onTap: () => provider.handleTodo(context),
            ),
          ),
        ],
      ),
    );
  }
}
