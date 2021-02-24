import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/widgets/text/label/styles.dart';

class Label extends StatelessWidget with LabelStyles {
  final String text;
  final bool large;
  final EdgeInsets margin;

  Label(
    this.text, {
    Key key,
    this.margin,
    this.large = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: textStyle(large),
      ),
    );
  }
}
