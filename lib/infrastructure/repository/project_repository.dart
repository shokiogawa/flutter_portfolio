import 'dart:io';

import 'package:communitygetandpost/infrastructure/database/database_manager.dart';
import 'package:image_picker/image_picker.dart';

class ProjectRepository{
  final DatabaseManager databaseManager;
  ProjectRepository(this.databaseManager);

  Future<File>getImage() async{
    final imagePicker = ImagePicker();
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    return File(image.path);
  }

}