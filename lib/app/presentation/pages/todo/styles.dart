import 'package:flutter/material.dart';

import 'package:todo_list/constants/theme.dart';

mixin TodoPageStyles {
  EdgeInsets inputContainerPadding(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return EdgeInsets.only(
      top: screenSize.height * .12,
      left: TLTheme.padding,
      right: TLTheme.padding,
      bottom: screenSize.height * .06,
    );
  }

  EdgeInsets labelContainerPadding() {
    return EdgeInsets.symmetric(vertical: 15, horizontal: TLTheme.padding);
  }

  BoxDecoration colorDisplayDecoration(Color color) {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(TLTheme.radius)),
      color: color,
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(.4),
          spreadRadius: 2,
          blurRadius: 10,
        ),
      ],
    );
  }

  EdgeInsets colorDisplayMargin() {
    return EdgeInsets.only(
      left: TLTheme.padding,
      right: TLTheme.padding,
      bottom: 15,
    );
  }

  EdgeInsets glowingButtonMargin() {
    return EdgeInsets.only(bottom: TLTheme.padding, right: TLTheme.padding);
  }

  TextStyle glowingButtonMarginTextStyle() {
    return TextStyle(fontSize: 20);
  }
}
