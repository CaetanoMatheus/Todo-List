import 'package:flutter/material.dart';
import 'package:todo_list/app/presentation/bloc/todo_page/todo_page_bloc.dart';

import 'package:todo_list/app/presentation/pages/todo/widgets/todo_bar/styles.dart';
import 'package:todo_list/app/presentation/widgets/button/delete_icon_button/delete_icon_button.dart';
import 'package:todo_list/app/presentation/widgets/dialog/delete_alert_dialog.dart';

class TodoAppBar extends StatelessWidget
    with TodoAppStyles
    implements PreferredSizeWidget {
  final TodoPageBloc controller;

  TodoAppBar({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(padding: leadingPadding(), child: CloseButton()),
      actions: controller.pageAction == TodoPageAction.update
          ? [
              DeleteIconButton(
                padding: EdgeInsets.only(right: 10),
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => DeleteAlertDialog(
                    itemName: 'task',
                    onConfirm: () => controller.deleteTodo(context),
                  ),
                ),
              ),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
