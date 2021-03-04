import 'package:flutter/material.dart';

import 'package:todo_list/app/domain/entities/category.dart';
import 'package:todo_list/app/domain/entities/todo.dart';
import 'package:todo_list/app/presentation/bloc/home_page/home_page_bloc.dart';
import 'package:todo_list/app/presentation/widgets/card/card_with_color_line/card_with_color_line.dart';
import 'package:todo_list/app/presentation/widgets/card/checkbox_card/checkbox_card.dart';
import 'package:todo_list/app/presentation/widgets/dialog/delete_alert_dialog.dart';
import 'package:todo_list/app/presentation/pages/home/widgets/app_bar/app_bar.dart';
import 'package:todo_list/app/presentation/pages/home/widgets/floating_action_button/floating_action_button.dart';
import 'package:todo_list/app/presentation/widgets/text/label/label.dart';
import 'package:todo_list/constants/colors_hex.dart';
import 'package:todo_list/constants/theme.dart';
import 'package:todo_list/router/routes.dart';
import 'package:todo_list/injection_container.dart' as ic;

class HomePage extends StatelessWidget {
  final controller = ic.get<HomePageBloc>();

  @override
  Widget build(BuildContext context) {
    controller();

    return StreamBuilder(
      stream: controller.output,
      builder: (_, snapshot) => Scaffold(
        appBar: HomeAppBar(),
        floatingActionButton: HomeFloatingActionButton(controller: controller),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: TLTheme.padding),
              child: Label('CATEGORIES'),
            ),
            Container(
              height: 190,
              child: this._buildCategoriesList(context),
            ),
            Padding(
              padding: EdgeInsets.only(left: TLTheme.padding, bottom: 10),
              child: Label('YOUR TASKS'),
            ),
            this._buildTodosList(context),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesList(BuildContext context) {
    return ListView.builder(
      physics: TLTheme.physics,
      scrollDirection: Axis.horizontal,
      itemCount: controller.categories.length,
      itemBuilder: (_, int index) {
        return _buildCategoryItem(context, controller.categories[index]);
      },
    );
  }

  Widget _buildCategoryItem(BuildContext context, Category category) {
    return CardWithColorLine(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(left: TLTheme.padding, top: 15),
      label: '${controller.remainigTodos[category.id] ?? 0} tasks',
      title: category.name,
      color: ColorsHex.color(category.color),
      onLongPress: () => showDialog(
        context: context,
        builder: (_) => DeleteAlertDialog(
          itemName: 'category',
          onConfirm: () => controller.deleteCategory(category),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.category,
          arguments: [category.id],
        );
      },
    );
  }

  Widget _buildTodosList(
    BuildContext context,
  ) {
    return Column(
      children: controller.todos
          .map<Widget>(
            (Todo todo) => _buildTodoItem(context, todo),
          )
          .toList(),
    );
  }

  Widget _buildTodoItem(
    BuildContext context,
    Todo todo,
  ) {
    return Dismissible(
      key: Key('${todo.id}'),
      confirmDismiss: (_) => showDialog(
        context: context,
        builder: (_) => DeleteAlertDialog(
          itemName: 'task',
          onConfirm: () => controller.deleteTodo(todo),
        ),
      ),
      child: CheckboxCard(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        title: todo.title,
        checked: todo.done,
        color: ColorsHex.color(todo.category.color),
        onTap: () => Navigator.pushNamed(
          context,
          Routes.todo,
          arguments: [todo.id, todo.category.id],
        ),
        onChange: () => controller.toggleTodoCheck(todo),
      ),
    );
  }
}
