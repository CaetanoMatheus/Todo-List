import 'package:flutter/material.dart';

import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/constants/theme.dart';

mixin CardWithColorLineStyles {
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
    return EdgeInsets.only(top: 30, bottom: 15, right: 20, left: 20);
  }

  EdgeInsets labelMargin() {
    return EdgeInsets.only(bottom: 10);
  }

  TextStyle titleStyle() {
    return TextStyle(fontSize: 22, fontWeight: FontWeight.w500);
  }

  BoxDecoration colorDisplayDecoration(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(TLTheme.radius)),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(.2),
          spreadRadius: 5,
          blurRadius: 12,
        ),
      ],
    );
  }
}
