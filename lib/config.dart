import 'package:flutter/material.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:communitygetandpost/secret.dart';

enum Flavor { develop, product }

class Config {
  final Flavor flavor;
  Config(this.flavor);
  TwitterLogin twitterLogin() {
    TwitterLogin twitterLogin;
    switch (this.flavor) {
      case Flavor.develop:
        twitterLogin =
            TwitterLogin(consumerKey: apiKey, consumerSecret: secretKey);
        break;
      case Flavor.product:
        twitterLogin = TwitterLogin(
            consumerKey: productApiKey, consumerSecret: productSecretKey);
        break;
    }
    return twitterLogin;
  }
}
