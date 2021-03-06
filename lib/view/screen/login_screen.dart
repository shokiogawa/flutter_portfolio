import 'package:communitygetandpost/presentation/controller/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            onPressed: () =>
                Provider.of<LoginPageController>(context, listen: false)
                    .signInGoogle()
                    .then((value) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/home_screen", (route) => false);
            }),
            color: Colors.blueGrey,
            child: Text("Googleログイン"),
          ),
          RaisedButton(
              onPressed: () =>
                  Provider.of<LoginPageController>(context, listen: false)
                      .signInTwitter()
                      .then((value) => Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                              "/home_screen", (routes) => false)),
              color: Colors.amber,
              child: Text("Twitterログイン"))
        ],
      ),
    ));
  }
}
