import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/widgets/card/card_with_color_line/styles.dart';
import 'package:todo_list/app/presentation/widgets/text/label/label.dart';

class CardWithColorLine extends StatelessWidget with CardWithColorLineStyles {
  final void Function() onTap;
  final void Function() onLongPress;
  final double height;
  final double width;
  final EdgeInsets margin;
  final Alignment alignment;
  final String label;
  final String title;
  final Color color;

  CardWithColorLine({
    Key key,
    this.onTap,
    this.alignment,
    this.margin,
    this.height = 130,
    this.width = 250,
    this.label,
    this.title,
    this.color,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: alignment,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: containerPadding(),
        decoration: containerDecoration(),
        child: InkWell(
          onLongPress: onLongPress,
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(label, margin: labelMargin()),
              Text(title, overflow: TextOverflow.ellipsis, style: titleStyle()),
              SizedBox(height: 15),
              Container(height: 3, decoration: colorDisplayDecoration(color))
            ],
          ),
        ),
      ),
    );
  }
}
