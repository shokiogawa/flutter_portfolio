import 'package:flutter/material.dart';

class SnackBarComponent extends SnackBar {
  SnackBarComponent(BuildContext context) : super(
    content: Text('定員いっぱいです。参加できませんでした。'),
    action: SnackBarAction(
      label: '閉じる',
      onPressed: () {
        Scaffold.of(context).removeCurrentSnackBar();
      },
    ),
    duration: Duration(seconds: 10),
  );
}


