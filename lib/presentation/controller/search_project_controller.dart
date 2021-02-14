import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/infrastructure/repository/project_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'search_project_controller.freezed.dart';

@freezed
abstract class SearchProjectState with _$SearchProjectState {
  factory SearchProjectState({List<Project> searcedProject}) =
      _SearchProjectState;
}

class SearchProjectController extends StateNotifier<SearchProjectState> {
  final ProjectRepository projectRepository;

  SearchProjectController(this.projectRepository) : super(SearchProjectState());

  Future<void> searchProjects(String query) async {
    var searchProject;
    searchProject = await projectRepository.searchProjects(query);
    state = state.copyWith(searcedProject: searchProject);
  }

  void disposeState(){
    state = state.copyWith(searcedProject: List<Project>());
  }
}
