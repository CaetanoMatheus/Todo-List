import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/data/models/category.dart';

import 'package:todo_list/app/data/models/todo.dart';
import 'package:todo_list/app/presentation/widgets/card/card_with_color_line/card_with_color_line.dart';
import 'package:todo_list/app/presentation/widgets/card/checkbox_card/checkbox_card.dart';
import 'package:todo_list/app/presentation/widgets/dialog/delete_alert_dialog.dart';
import 'package:todo_list/app/presentation/pages/home/widgets/app_bar/app_bar.dart';
import 'package:todo_list/app/presentation/pages/home/widgets/floating_action_button/floating_action_button.dart';
import 'package:todo_list/app/presentation/providers/pages/home_page_provider.dart';
import 'package:todo_list/app/presentation/widgets/text/label/label.dart';
import 'package:todo_list/constants/colors_hex.dart';
import 'package:todo_list/constants/theme.dart';
import 'package:todo_list/router/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context, listen: false);

    return FutureBuilder(
      future: provider(),
      builder: (_, AsyncSnapshot<void> snapshot) {
        return Scaffold(
          appBar: HomeAppBar(),
          floatingActionButton: HomeFloatingActionButton(),
          body: ListView(
            children: [
              Label('CATEGORIES'),
              Label('YOUR TASKS'),
              this._buildTodosList(context, provider),
            ],
          ),
        );
      },
    );
  }

  // Widget _buildCategoriesList(BuildContext context, HomePageProvider provider) {
  //   return ListView.builder(
  //     physics: TLTheme.physics,
  //     scrollDirection: Axis.horizontal,
  //     itemCount: provider.categories.length,
  //     itemBuilder: (_, int index) {
  //       return _buildCategoryItem(context, provider.categories[index]);
  //     },
  //   );
  // }

  Widget _buildCategoryItem(BuildContext context, Category category) {
    return CardWithColorLine(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(left: TLTheme.padding),
      label: '40 tasks',
      title: category.name,
      color: ColorsHex.color(category.color),
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.category,
          arguments: category.id,
        );
      },
    );
  }

  Widget _buildTodosList(
    BuildContext context,
    HomePageProvider provider,
  ) {
    return Column(
      children: provider.todos
          .map(
            (Todo todo) => _buildTodoItem(context, provider, todo),
          )
          .toList(),
    );
  }

  Widget _buildTodoItem(
    BuildContext context,
    HomePageProvider provider,
    Todo todo,
  ) {
    return Dismissible(
      key: Key('${todo.id}'),
      confirmDismiss: (_) => showDialog(
        context: context,
        builder: (_) => DeleteAlertDialog(
          itemName: 'task',
          onConfirm: () => provider.deleteTodo(todo),
        ),
      ),
      child: CheckboxCard(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        title: todo.title,
        checked: todo.done,
        onTap: () => Navigator.pushNamed(
          context,
          Routes.todo,
          arguments: todo.id,
        ),
        onChange: () => provider.toggleTodoCheck(todo),
      ),
    );
  }
}
