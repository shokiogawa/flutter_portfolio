import 'package:communitygetandpost/infrastructure/database/database_manager.dart';
import 'package:communitygetandpost/infrastructure/repository/project_repository.dart';
import 'package:communitygetandpost/presentation/controller/get_project_controller.dart';
import 'package:flutter_riverpod/all.dart';

final databaseManager = Provider((ref) => DatabaseManager());
final projectRepository = Provider((ref) => ProjectRepository(ref.watch(databaseManager)));
final getProjectController = StateNotifierProvider((ref) => GetProjectController(ref.watch(projectRepository)));