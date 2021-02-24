import 'package:flutter/material.dart';

class DeleteAlertDialog extends StatelessWidget {
  final String itemName;
  final void Function() onConfirm;

  const DeleteAlertDialog({
    Key key,
    this.itemName = 'item',
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete $itemName?'),
      content: Text('Are you sure you want to delete this $itemName?'),
      actions: [
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text('Confirm'),
          onPressed: () {
            Navigator.pop(context);
            if (onConfirm != null) onConfirm();
          },
        )
      ],
    );
  }
}
