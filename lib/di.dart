import 'package:communitygetandpost/infrastructure/database/database_manager.dart';
import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';
import 'package:communitygetandpost/presentation/controller/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

//アプリで使うProvider全て
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModel,
  ...viewModel
];
//他のどのクラスにも依存しないModel
List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(create: (_) => DatabaseManager())
];

//上で登録したクラスに依存しているModel
List<SingleChildWidget> dependentModel = [
  ProxyProvider<DatabaseManager, UserRepository>(
      update: (_, dbManager, userRepository) => UserRepository(dbManager))
];

//UI(VIEW)から直接使う。上で登録したクラスを使える。
List<SingleChildWidget> viewModel = [
  Provider<LoginPageController>(
    create: (context) => LoginPageController(
        Provider.of<UserRepository>(context, listen: false)),
  )
];
