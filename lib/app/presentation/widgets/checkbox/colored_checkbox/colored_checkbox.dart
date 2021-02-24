import 'package:flutter/material.dart';

import 'package:todo_list/constants/colors.dart';

class ColoredCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function() onTap;
  final Color color;

  const ColoredCheckbox({
    Key key,
    this.isChecked,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color:
              isChecked ? TLColors.color(TLColors.label) : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: isChecked
              ? null
              : Border.all(
                  color: color ?? TLColors.color(TLColors.primary),
                  width: 2,
                ),
        ),
        child:
            isChecked ? Icon(Icons.done, color: Colors.white, size: 16) : null,
      ),
    );
  }
}
