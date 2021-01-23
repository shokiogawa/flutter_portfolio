import 'dart:io';

import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/domain/value_object/user.dart';
import 'package:communitygetandpost/infrastructure/database/database_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ProjectRepository {
  final DatabaseManager databaseManager;

  ProjectRepository(this.databaseManager);

  Future<File> getImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    return File(image.path);
  }

  Future<void> insertProjectToDb(User postUser,
      String projectName,
      String projectEx,
      File imageFile,
      // String storagePath,
      int paNumber,
      DateTime dateTime) async {
    final String storageId = Uuid().v1();
    final imageUrl = await databaseManager.uploadImageToStorage(
        imageFile, storageId);
    final project = Project(projectId: Uuid().v1(),
        userId: postUser.userId,
        projectName: projectName,
        projectExplanation: projectEx,
        imageUrl: imageUrl,
        imageStoragePath: storageId,
        participantNumber: paNumber,
        postDateTime: dateTime);
    await databaseManager.insertProject(project);
  }

  Future<List<Project>>getProject() async{
    return await databaseManager.getProject();
  }

  Future<List<Project>>getMyProject() async{
    return await databaseManager.getMyProject();
  }
}
