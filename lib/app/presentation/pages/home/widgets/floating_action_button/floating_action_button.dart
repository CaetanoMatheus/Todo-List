import 'package:flutter/material.dart';

import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/router/routes.dart';

class HomeFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (_) => Container(
          child: Wrap(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('What do you wanna create?'),
                  ),
                  Spacer(),
                  CloseButton(
                    color: TLColors.color(TLColors.label),
                  ),
                ],
              ),
              buildListTile(
                context,
                'Create Category',
                Icons.list,
                Routes.category,
              ),
              buildListTile(
                context,
                'Create Task',
                Icons.done_outline,
                Routes.todo,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon, color: TLColors.color(TLColors.label)),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
