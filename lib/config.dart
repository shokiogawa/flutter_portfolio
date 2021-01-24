import 'package:flutter/material.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:communitygetandpost/secret.dart';

enum Flavor { develop, production }

class Config {
  static Flavor flavor;

  // static String getString(){
  //   switch(flavor){
  //     case Flavor.develop:
  //       return "develop";
  //     case Flavor.production:
  //       return "production";
  //     default:
  //       return "環境エラー";
  //   }
  //
  // }
  TwitterLogin twitterLogin(flavor) {
    TwitterLogin twitterLogin;
    switch (flavor) {
      case Flavor.develop:
        twitterLogin =
            TwitterLogin(consumerKey: apiKey, consumerSecret: secretKey);
        break;
      case Flavor.production:
        twitterLogin = TwitterLogin(
            consumerKey: productApiKey, consumerSecret: productSecretKey);
        break;
    }
    return twitterLogin;
  }
}
