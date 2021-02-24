import 'package:flutter/material.dart';

import 'package:todo_list/app/presentation/widgets/text/title/styles.dart';

class TLTitle extends StatelessWidget with TLTileStyles {
  final String text;
  final EdgeInsets margin;

  const TLTitle(this.text, {Key key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: margin, child: Text(text, style: textStyle()));
  }
}
