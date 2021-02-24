import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/widgets/card/checkbox_card/styles.dart';
import 'package:todo_list/app/presentation/widgets/checkbox/colored_checkbox/colored_checkbox.dart';

class CheckboxCard extends StatelessWidget with CheckboxCardStyles {
  final void Function() onTap;
  final void Function() onChange;
  final String title;
  final bool checked;
  final double height;
  final double width;
  final EdgeInsets margin;
  final Alignment alignment;

  CheckboxCard({
    Key key,
    this.onTap,
    this.alignment,
    this.margin = const EdgeInsets.all(0),
    this.width,
    this.height = 80,
    this.onChange,
    this.checked,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return UnconstrainedBox(
      child: Container(
        height: height,
        width: width ?? (size.width - (margin.left + margin.right)),
        margin: margin,
        padding: containerPadding(),
        decoration: containerDecoration(),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Padding(
                padding: checkboxPadding(),
                child: ColoredCheckbox(isChecked: checked, onTap: onChange),
              ),
              Flexible(child: Text(title, style: titleStyle(checked))),
            ],
          ),
        ),
      ),
    );
  }
}
