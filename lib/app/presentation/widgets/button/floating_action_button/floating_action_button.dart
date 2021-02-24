import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/widgets/button/floating_action_button/styles.dart';

class TLFloatingActionButton extends StatelessWidget
    with TLFloatingActionButtonStyles {
  final Widget child;
  final void Function() onTap;

  const TLFloatingActionButton({
    Key key,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      child: Container(
        child: child,
        height: 56.0,
        width: 56.0,
        decoration: containerDecoration(),
      ),
    );
  }
}
