import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/domain/value_object/user.dart';
import 'package:communitygetandpost/infrastructure/repository/project_repository.dart';
import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'get_project_controller.freezed.dart';

@freezed
abstract class GetProjectState with _$GetProjectState {
  factory GetProjectState({
    List<Project> allProjects,
    List<Project> joinProjects,
    List<Project> myProject,
    List<User> joinUser,
    Map<int, List<Project>> mapProject,
    @Default(false) bool meJoined,
  }) = _GetProjectState;
}

class GetProjectController extends StateNotifier<GetProjectState> {
  final ProjectRepository projectRepository;

  GetProjectController(this.projectRepository)
      : super(GetProjectState(myProject: List<Project>()));

  Future<void> getProject(int number) async {
    if (number == 0) {
      var joinedProjects;
      joinedProjects = await projectRepository.getJoinedProject();
      state = state.copyWith(joinProjects: joinedProjects);
      print("あなたが参加しているプロジェクトは" + state.joinProjects.length.toString());
    } else {
      // if(state.myProject == null){
      var myProject;
      myProject = await projectRepository.getMyProject();
      state = state.copyWith(myProject: myProject);
      print(state.myProject);
    }
  }

  Future<void> getMyProject() async {
    if (state.myProject == null) {
      var myProject;
      myProject = await projectRepository.getMyProject();
      state = state.copyWith(myProject: myProject);
      print(state.myProject);
    }
  }

  Future<bool> findJoinMembers(Project project, int limitedNumber) async {
    return await projectRepository.findJoinMembers(project, limitedNumber);
  }

  Future<void> getJoinMembersAndIdentifyInMember(String projectId) async {
    var memberList;
    memberList = await projectRepository.getJoinMembers(projectId);
    state = state.copyWith(joinUser: memberList);
    print("参加メンバー:" + state.joinUser.length.toString());
    var isJoined;
    isJoined = await projectRepository.identifyInMember(
        projectId, UserRepository.currentUser.userId);
    state = state.copyWith(meJoined: isJoined);
  }

  Future<void> getCategorizedProject() async {
    var categorizedProject;
    categorizedProject = await projectRepository.getCategorizedProject();
    state = state.copyWith(mapProject: categorizedProject);
    print(state.mapProject[0]);
  }

  Future<void> getJoinedProject()async{
    var joinedProjects;
    joinedProjects = await projectRepository.getJoinedProject();
    state = state.copyWith(joinProjects: joinedProjects);
    print("あなたが参加しているプロジェクトは" + state.joinProjects.length.toString());
  }
}
