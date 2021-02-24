import 'package:flutter/material.dart';

import 'package:todo_list/constants/theme.dart';

mixin ColorCardStyles {
  BoxDecoration containerDecoration(Color color, bool alpha) {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(TLTheme.radius)),
      color: alpha ? color.withAlpha(100) : color,
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(.5),
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 8),
        ),
      ],
    );
  }
}
