import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/app/presentation/widgets/card/checkbox_card/checkbox_card.dart';
import 'package:todo_list/app/presentation/widgets/dialog/delete_alert_dialog.dart';
import 'package:todo_list/app/presentation/pages/home/widgets/app_bar/app_bar.dart';
import 'package:todo_list/app/presentation/pages/home/widgets/floating_action_button/floating_action_button.dart';
import 'package:todo_list/app/presentation/providers/pages/home_page_provider.dart';
import 'package:todo_list/router/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (__, HomePageProvider provider, _) => FutureBuilder(
        future: provider(),
        builder: (_, AsyncSnapshot<void> snapshot) {
          return Scaffold(
            appBar: HomeAppBar(),
            floatingActionButton: HomeFloatingActionButton(),
            body: buildTodosList(context, provider),
          );
        },
      ),
    );
  }

  Widget buildTodosList(
    BuildContext context,
    HomePageProvider provider,
  ) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: provider.todos.length,
      itemBuilder: (_, int index) => buildTodoItem(context, provider, index),
    );
  }

  Widget buildTodoItem(
    BuildContext context,
    HomePageProvider provider,
    int index,
  ) {
    return Dismissible(
      key: Key('$index'),
      confirmDismiss: (_) => showDialog(
        context: context,
        builder: (_) => DeleteAlertDialog(
          itemName: 'task',
          onConfirm: () => provider.deleteTodo(provider.todos[index]),
        ),
      ),
      child: CheckboxCard(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        title: provider.todos[index].title,
        checked: provider.todos[index].done,
        onTap: () => Navigator.pushNamed(
          context,
          Routes.todo,
          arguments: provider.todos[index].id,
        ),
        onChange: () => provider.toggleTodoCheck(provider.todos[index]),
      ),
    );
  }
}
