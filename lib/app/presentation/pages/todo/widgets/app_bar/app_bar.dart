import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/app/presentation/pages/todo/widgets/app_bar/styles.dart';
import 'package:todo_list/app/presentation/providers/pages/todo_page_provider.dart';
import 'package:todo_list/app/presentation/widgets/button/delete_icon_button/delete_icon_button.dart';
import 'package:todo_list/app/presentation/widgets/dialog/delete_alert_dialog.dart';

class TodoAppBar extends StatelessWidget
    with CategoryAppBarStyles
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoPageProvider>(
      builder: (__, TodoPageProvider provider, _) => AppBar(
        leading: Padding(
          padding: leadingPadding(),
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => provider.finish(context),
          ),
        ),
        actions: provider.pageAction == PageAction.update
            ? [
                DeleteIconButton(
                  padding: EdgeInsets.only(right: 10),
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => DeleteAlertDialog(
                      itemName: 'task',
                      onConfirm: () => provider.deleteTodo(context),
                    ),
                  ),
                ),
              ]
            : [],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
