import 'package:flutter/material.dart';

import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/constants/theme.dart';

mixin CheckboxCardStyles {
  BoxDecoration containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(TLTheme.radius)),
      color: TLColors.color(TLColors.background3),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.15),
          spreadRadius: 2,
          blurRadius: 20,
          offset: Offset(0, 8),
        ),
      ],
    );
  }

  EdgeInsets containerPadding() {
    return EdgeInsets.only(right: 12);
  }

  EdgeInsets checkboxPadding() {
    return EdgeInsets.symmetric(horizontal: 12);
  }

  TextStyle titleStyle(bool isChecked) {
    return TextStyle(
      color: isChecked
          ? TLColors.color(TLColors.label)
          : TLColors.color(TLColors.text),
      decoration: isChecked ? TextDecoration.lineThrough : null,
      fontSize: 15,
    );
  }
}
