import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/widgets/button/glowing_button/styles.dart';

class GlowingButton extends StatelessWidget with GlowingButtonStyles {
  final Widget child;
  final Color color;
  final EdgeInsets margin;
  final double height;
  final double width;
  final void Function() onTap;

  const GlowingButton({
    Key key,
    this.child,
    this.onTap,
    this.color,
    this.margin,
    this.width,
    this.height = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: background(color),
      child: FlatButton(
        shape: buttonShape(),
        color: backgroundColor(color),
        onPressed: onTap,
        child: Padding(padding: childPadding(), child: child),
      ),
    );
  }
}
