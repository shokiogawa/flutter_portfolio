import 'package:flutter/material.dart';

class SnackBarComponent extends SnackBar {
  SnackBarComponent(BuildContext context) : super(
    content: Text('エラーが発生しました'),
    action: SnackBarAction(
      label: '閉じる',
      onPressed: () {
        Scaffold.of(context).removeCurrentSnackBar();
      },
    ),
    duration: Duration(seconds: 10),
  );
}


