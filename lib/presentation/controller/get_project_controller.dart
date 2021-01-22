


import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/infrastructure/repository/project_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'get_project_controller.freezed.dart';

@freezed
abstract class GetProjectState with _$GetProjectState{
  factory GetProjectState({
    List<Project> allProjects,
    List<Project> joinProjects,
}) = _GetProjectState;
}

class GetProjectController extends StateNotifier<GetProjectState>{
  final ProjectRepository projectRepository;
  GetProjectController(this.projectRepository) : super(GetProjectState());

  Future<void> getProject()async{
    var _allProject;
    _allProject = await projectRepository.getProject();
    state = state.copyWith(allProjects: _allProject);
    print(state.allProjects);
  }
}