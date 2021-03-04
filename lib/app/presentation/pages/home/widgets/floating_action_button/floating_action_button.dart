import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/bloc/home_page/home_page_bloc.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/router/routes.dart';

class HomeFloatingActionButton extends StatelessWidget {
  final HomePageBloc controller;

  HomeFloatingActionButton({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => buildCategortOrTodoSelection(context),
    );
  }

  Future<Widget> buildCategortOrTodoSelection(BuildContext context) {
    return showModalBottomSheet(
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
            ListTile(
              leading: Icon(Icons.list, color: TLColors.color(TLColors.label)),
              title: Text('Create Category'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.category);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.done_outline,
                color: TLColors.color(TLColors.label),
              ),
              title: Text('Create Task'),
              onTap: () {
                Navigator.pop(context);
                buildCategoriesSelector(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> buildCategoriesSelector(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        child: Wrap(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: CloseButton(color: TLColors.color(TLColors.label)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 25),
              child: Text(
                'Select a category for your task.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .9,
              child: ListView.builder(
                itemCount: controller.categories.length,
                itemBuilder: (_, int index) => ListTile(
                  leading: Icon(
                    Icons.list,
                    color: TLColors.color(TLColors.label),
                  ),
                  title: Text(controller.categories[index].name),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      Routes.todo,
                      arguments: [null, controller.categories[index].id],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
