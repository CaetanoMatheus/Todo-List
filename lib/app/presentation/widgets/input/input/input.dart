import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/widgets/input/input/styles.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/constants/theme.dart';

class Input extends StatelessWidget with InputStyles {
  final TextEditingController controller;
  final String hint;
  final String errorText;
  final String initialValue;
  final bool isInvalid;
  final int maxLines;
  final String Function(String) validator;
  final void Function(String) onChange;
  final void Function(String) onSaved;

  const Input({
    Key key,
    this.controller,
    this.hint = '',
    this.errorText = '',
    this.initialValue = '',
    this.isInvalid = false,
    this.maxLines,
    this.onChange,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      initialValue: initialValue,
      onChanged: onChange,
      onSaved: onSaved,
      validator: validator,
      cursorColor: TLColors.color(TLColors.text),
      scrollPhysics: TLTheme.physics,
      style: inputTextStyle(),
      decoration: inputDecoration(hint, errorText, isInvalid),
    );
  }
}
