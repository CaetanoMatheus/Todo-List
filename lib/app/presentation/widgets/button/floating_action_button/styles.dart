import 'package:flutter/painting.dart';

import 'package:todo_list/constants/colors.dart';

mixin TLFloatingActionButtonStyles {
  BoxDecoration containerDecoration() {
    return BoxDecoration(
      color: TLColors.color(TLColors.primary),
      borderRadius: BorderRadius.all(Radius.circular(100)),
      boxShadow: [
        BoxShadow(
          color: TLColors.color(TLColors.primary).withOpacity(.5),
          blurRadius: 10,
          offset: Offset(2, 7),
        )
      ],
    );
  }
}
