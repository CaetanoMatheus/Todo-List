import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/app/presentation/pages/todo/widgets/app_bar/styles.dart';
import 'package:todo_list/app/presentation/providers/pages/category_page_provider.dart';
import 'package:todo_list/app/presentation/widgets/button/delete_icon_button/delete_icon_button.dart';
import 'package:todo_list/app/presentation/widgets/dialog/delete_alert_dialog.dart';

class CategoryAppBar extends StatelessWidget
    with CategoryAppBarStyles
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryPageProvider>(context, listen: false);

    return AppBar(
      leading: Padding(padding: leadingPadding(), child: CloseButton()),
      actions: provider.pageAction == CategoryPageAction.update
          ? [
              DeleteIconButton(
                padding: EdgeInsets.only(right: 10),
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => DeleteAlertDialog(
                    itemName: 'task',
                    onConfirm: () => provider.deleteCategory(context),
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
