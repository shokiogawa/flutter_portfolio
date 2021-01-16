import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ログイン画面"),
      ),
      body: LoginPageContainer(),
    );
  }
}

class LoginPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        children: [
          RaisedButton(
            onPressed: null,
            color: Colors.blueGrey,
            child: Text("Googleログイン"),
          ),
          RaisedButton(
              onPressed: null, color: Colors.amber, child: Text("Twitterログイン"))
        ],
      ),
    ));
  }
}
