

import 'package:communitygetandpost/domain/value_object/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'new_post_page_controller.freezed.dart';

@freezed
abstract class ProjectState with _$ProjectState{
  factory ProjectState({
    String projectName,
    String projectExplanation,
    String imageUrl,
    int participantNumber,
    User hostUser,
    DateTime projectOpenTime
}) = _ProjectState;
}


class ProjectController extends StateNotifier<ProjectState>{
  ProjectController(): super(ProjectState());


  //フォームのデータをstateに管理。
  void getNameAndExplanation(String name, String explanation){
    state = state.copyWith(projectName: name, projectExplanation: explanation);
  }
}