import 'package:flutter/material.dart';
import 'package:todo_list/app/presentation/bloc/category_page/category_page_bloc.dart';
import 'package:todo_list/app/presentation/pages/category/widgets/category_bar/styles.dart';

import 'package:todo_list/app/presentation/widgets/button/delete_icon_button/delete_icon_button.dart';
import 'package:todo_list/app/presentation/widgets/dialog/delete_alert_dialog.dart';

class CategoryAppBar extends StatelessWidget
    with CategoryAppBarStyles
    implements PreferredSizeWidget {
  final CategoryPageBloc controller;

  CategoryAppBar({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(padding: leadingPadding(), child: CloseButton()),
      actions: controller.pageAction == CategoryPageAction.update
          ? [
              DeleteIconButton(
                padding: EdgeInsets.only(right: 10),
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => DeleteAlertDialog(
                    itemName: 'category',
                    onConfirm: () => controller.deleteCategory(context),
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
