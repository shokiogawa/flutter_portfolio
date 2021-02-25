import 'package:communitygetandpost/config.dart';
import 'package:communitygetandpost/infrastructure/database/database_manager.dart';
import 'package:communitygetandpost/infrastructure/location_manager/location_manager.dart';
import 'package:communitygetandpost/infrastructure/repository/project_repository.dart';
import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';
import 'package:communitygetandpost/main.dart';
import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
import 'package:communitygetandpost/presentation/controller/login_page_controller.dart';
import 'package:communitygetandpost/presentation/controller/new_post_page_controller.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

//アプリで使うProvider全て
List<SingleChildWidget> productGlobalProviders = [
  ...independentModels,
  ...dependentModel,
  ...viewModel
];
//他のどのクラスにも依存しないModel
List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(create: (_) => DatabaseManager()),
  Provider<LocationManager>(create: (_) => LocationManager(),),
  Provider<Config>(create: (_) => Config(Flavor.product))
];

//上で登録したクラスに依存しているModel
List<SingleChildWidget> dependentModel = [
  ProxyProvider2<DatabaseManager,Config ,UserRepository>(
      update: (_, dbManager,config ,userRepository) => UserRepository(dbManager, config)),
  ProxyProvider2<DatabaseManager,LocationManager, ProjectRepository>(
      update: (_, databaseManager,locationManager, projectRepository) =>
          ProjectRepository(databaseManager, locationManager)),
];

//UI(VIEW)から直接使う。上で登録したクラスを使える。
List<SingleChildWidget> viewModel = [
  Provider<LoginPageController>(
    create: (context) => LoginPageController(
        Provider.of<UserRepository>(context, listen: false)),
  ),
  StateNotifierProvider<ProjectController, ProjectState>(
      create: (context) => ProjectController(
          Provider.of<ProjectRepository>(context, listen: false))),
  StateNotifierProvider<GetProjectController, GetProjectState>(
      create: (context) => GetProjectController(
          Provider.of<ProjectRepository>(context, listen: false)))
];
