import 'package:flutter/material.dart';

import 'package:todo_list/router/routes.dart';

class HomeFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, Routes.todo),
    );
  }
}
