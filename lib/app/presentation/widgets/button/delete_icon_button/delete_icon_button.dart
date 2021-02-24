import 'package:flutter/material.dart';

class DeleteIconButton extends StatelessWidget {
  final bool isDarkMode;
  final EdgeInsets padding;
  final void Function() onTap;

  DeleteIconButton({
    Key key,
    this.isDarkMode,
    this.onTap,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: IconButton(
        icon: Icon(Icons.delete, color: Colors.red[400], size: 26),
        onPressed: onTap,
      ),
    );
  }
}
