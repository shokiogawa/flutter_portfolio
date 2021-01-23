import 'package:flutter/material.dart';

enum Flavor{
  develop,
  production
}

class Config{
  static Flavor flavor;

  static String getString(){
    switch(flavor){
      case Flavor.develop:
        return "develop";
      case Flavor.production:
        return "production";
      default:
        return "環境エラー";
    }

  }
}