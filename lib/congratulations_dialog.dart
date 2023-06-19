// congratulations_dialog.dart
import 'package:flutter/material.dart';

class CongratulationsDialog extends StatelessWidget {
  final String productName;

  CongratulationsDialog({required this.productName});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Congratulations!'),
      content: Text("You've bought 5 $productName!"),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
