import 'package:flutter/material.dart';

import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/constants/theme.dart';

mixin GlowingButtonStyles {
  BoxDecoration background(Color color) {
    return BoxDecoration(
      color: backgroundColor(color),
      borderRadius: BorderRadius.all(Radius.circular(TLTheme.radius / 2)),
      boxShadow: [
        BoxShadow(
          color: color != null
              ? color.withOpacity(.5)
              : TLColors.color(TLColors.primary).withOpacity(.5),
          blurRadius: 5,
        )
      ],
    );
  }

  RoundedRectangleBorder buttonShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(TLTheme.radius / 2)),
    );
  }

  EdgeInsets childPadding() {
    return EdgeInsets.symmetric(horizontal: 15);
  }

  Color backgroundColor(Color color) {
    return color != null
        ? color.withOpacity(.5)
        : TLColors.color(TLColors.primary).withOpacity(.5);
  }
}
