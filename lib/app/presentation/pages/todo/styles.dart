import 'package:flutter/material.dart';

import 'package:todo_list/constants/theme.dart';

mixin TodoPageStyles {
  EdgeInsets inputContainerPadding(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return EdgeInsets.only(
      top: screenSize.height * .12,
      left: TLTheme.padding,
      right: TLTheme.padding,
      bottom: screenSize.height * .09,
    );
  }

  EdgeInsets glowingButtonMargin() {
    return EdgeInsets.only(bottom: TLTheme.padding, right: TLTheme.padding);
  }

  TextStyle glowingButtonMarginTextStyle() {
    return TextStyle(fontSize: 20);
  }
}
