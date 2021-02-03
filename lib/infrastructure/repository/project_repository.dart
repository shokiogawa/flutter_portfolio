import 'dart:io';

import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/domain/value_object/user.dart';
import 'package:communitygetandpost/infrastructure/database/database_manager.dart';
import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

// final projectRepository = Provider((ref)=> ProjectRepository(DatabaseManager()));

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

  List<Project>getProjectOnRealTime() {
    return databaseManager.getProjectOnRealtime();
  }

  Future<bool>findJoinMembers(String projectId, int limitedNumber) async{
    var joinNumber;
    joinNumber = await databaseManager.findNumberOfMember(projectId, UserRepository.currentUser);
    if(joinNumber < limitedNumber){
      await databaseManager.joinMemberToProject(UserRepository.currentUser.userId, projectId, UserRepository.currentUser);
      print("成功");
      return true;
    }else{
      print("定員オーバー");
      return false;
    }

  }

  Future<List<User>>getJoinMembers(String projectId) async{
    return await databaseManager.getJoinMembers(projectId);
  }

  Future<bool> identifyInMember(String projectId, String userId) async{
    return await databaseManager.identifyInMembers(projectId, userId);
  }


}
