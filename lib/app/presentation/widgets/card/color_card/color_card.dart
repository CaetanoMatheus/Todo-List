import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/widgets/card/color_card/styles.dart';
import 'package:todo_list/constants/theme.dart';

class ColorCard extends StatelessWidget with ColorCardStyles {
  final void Function() onTap;
  final double height;
  final double width;
  final EdgeInsets margin;
  final Alignment alignment;
  final bool alpha;
  final Color color;

  ColorCard({
    Key key,
    this.onTap,
    this.alignment,
    this.margin,
    this.height = 70,
    this.width = 140,
    this.color,
    this.alpha = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: alignment,
      child: AnimatedContainer(
        duration: TLTheme.duration,
        height: height,
        width: width,
        margin: margin,
        decoration: containerDecoration(color, alpha),
        child: InkWell(onTap: onTap),
      ),
    );
  }
}
