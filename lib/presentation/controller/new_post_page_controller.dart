

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:communitygetandpost/domain/value_object/user.dart';
import 'package:communitygetandpost/infrastructure/repository/project_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'new_post_page_controller.freezed.dart';


@freezed
abstract class ProjectState with _$ProjectState{
  factory ProjectState({
    String projectName,
    String projectExplanation,
    File imageFile,
    int participantNumber,
    User hostUser,
    DateTime projectOpenTime
}) = _ProjectState;
}


class ProjectController extends StateNotifier<ProjectState>{
  final ProjectRepository projectRepository;
  ProjectController(this.projectRepository): super(ProjectState());


  //フォームのデータをstateに管理。
  void getNameAndExplanation(String name, String explanation){
    state = state.copyWith(projectName: name, projectExplanation: explanation);
    print(state.projectName);
    print(state.projectExplanation);
  }

  //画像を取得。
  Future<void> getImage() async{
    print("getimage");
    var image;
    image = await projectRepository.getImage();
    state = state.copyWith(imageFile: image);
  }
}