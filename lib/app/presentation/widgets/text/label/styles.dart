import 'package:flutter/material.dart';

import 'package:todo_list/constants/colors.dart';

mixin LabelStyles {
  TextStyle textStyle(bool large) {
    return TextStyle(
      color: TLColors.color(TLColors.label),
      fontSize: large ? 22 : 14,
    );
  }
}
