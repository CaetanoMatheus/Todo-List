import 'package:flutter/material.dart';

import 'package:todo_list/constants/colors.dart';

mixin InputStyles {
  TextStyle inputTextStyle() {
    return TextStyle(color: TLColors.color(TLColors.text), fontSize: 24);
  }

  InputDecoration inputDecoration(String hint, String errorText, bool invalid) {
    var borderStyle = UnderlineInputBorder(
      borderSide: BorderSide(
        color: TLColors.color(TLColors.label),
        width: 2,
      ),
    );

    return InputDecoration(
      hintText: hint,
      errorText: invalid ? errorText : null,
      contentPadding: EdgeInsets.symmetric(horizontal: 5),
      focusedBorder: borderStyle,
      enabledBorder: borderStyle,
    );
  }
}
