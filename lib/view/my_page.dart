import 'package:communitygetandpost/presentation/controller/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text("ログアウト"),
              onPressed: () => Provider.of<LoginPageController>(context,
                      listen: false)
                  .logOut()
                  .then((value) => Navigator.of(context)
                      .pushNamedAndRemoveUntil("/login_page", (route) => false)),
            ),
            Text("HOMEです。"),
          ],
        ),
      ),
    );
  }
}
