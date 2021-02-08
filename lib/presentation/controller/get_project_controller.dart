


import 'package:communitygetandpost/domain/value_object/category_project.dart';
import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/domain/value_object/user.dart';
import 'package:communitygetandpost/infrastructure/repository/project_repository.dart';
import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'get_project_controller.freezed.dart';

@freezed
abstract class GetProjectState with _$GetProjectState{
  factory GetProjectState({
    List<Project> allProjects,
    List<Project> joinProjects,
    List<Project> myProject,
    List<User> joinUser,
    List<CategoryProject> allCategoryProject,
    List<CategoryProject> myCategoryProject,
    @Default(false) bool meJoined,
}) = _GetProjectState;
}

class GetProjectController extends StateNotifier<GetProjectState>{
  final ProjectRepository projectRepository;
  GetProjectController(this.projectRepository) : super(GetProjectState(myProject: List<Project>()));

  Future<void> getProject(int number)async{
    if (number == 0){
      if(state.allProjects == null){
        var _allProject;
        _allProject = await projectRepository.getProject();
        state = state.copyWith(allProjects: _allProject);
        print("stateの長さ:" + state.allProjects.length.toString());
      }
    }else{
      // if(state.myProject == null){
        var myProject;
        myProject = await projectRepository.getMyProject();
        state = state.copyWith(myProject: myProject);
        print(state.myProject);


    }

  }

  Future<void> getCategoryProject(int number)async{
    if (number == 0){
        var _allProject;
        _allProject = await projectRepository.getCategoryProject();
        state = state.copyWith(allCategoryProject: _allProject);
        print("stateの長さ:" + state.allProjects.length.toString());

    }else{
      // if(state.myProject == null){
      var myProject;
      myProject = await projectRepository.getMyCategoryProject();
      state = state.copyWith(myCategoryProject: myProject);
      print(state.myProject);


    }

  }

  Future<void> getMyProject() async{
    if (state.myProject == null){
      var myProject;
      myProject = await projectRepository.getMyProject();
      state = state.copyWith(myProject: myProject);
      print(state.myProject);
    }

  }

  // void getProjectOnRealTime() async{
  //   state.allProjects.addAll(projectRepository.getProjectOnRealTime());
  // }

  Future<bool> findJoinMembers(String projectId, int limitedNumber ) async{
    return await projectRepository.findJoinMembers(projectId, limitedNumber);
  }

  Future<void> getJoinMembersAndIdentifyInMember(String projectId) async{
    var memberList;
    memberList = await projectRepository.getJoinMembers(projectId);
    state = state.copyWith(joinUser: memberList);
    print("参加メンバー:" + state.joinUser.length.toString());
    var isJoined;
    isJoined =  await projectRepository.identifyInMember(projectId, UserRepository.currentUser.userId);
    state = state.copyWith(meJoined: isJoined);
  }

}