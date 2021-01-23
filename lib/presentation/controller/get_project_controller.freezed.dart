// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'get_project_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GetProjectStateTearOff {
  const _$GetProjectStateTearOff();

// ignore: unused_element
  _GetProjectState call(
      {List<Project> allProjects,
      List<Project> joinProjects,
      List<Project> myProject}) {
    return _GetProjectState(
      allProjects: allProjects,
      joinProjects: joinProjects,
      myProject: myProject,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $GetProjectState = _$GetProjectStateTearOff();

/// @nodoc
mixin _$GetProjectState {
  List<Project> get allProjects;
  List<Project> get joinProjects;
  List<Project> get myProject;

  @JsonKey(ignore: true)
  $GetProjectStateCopyWith<GetProjectState> get copyWith;
}

/// @nodoc
abstract class $GetProjectStateCopyWith<$Res> {
  factory $GetProjectStateCopyWith(
          GetProjectState value, $Res Function(GetProjectState) then) =
      _$GetProjectStateCopyWithImpl<$Res>;
  $Res call(
      {List<Project> allProjects,
      List<Project> joinProjects,
      List<Project> myProject});
}

/// @nodoc
class _$GetProjectStateCopyWithImpl<$Res>
    implements $GetProjectStateCopyWith<$Res> {
  _$GetProjectStateCopyWithImpl(this._value, this._then);

  final GetProjectState _value;
  // ignore: unused_field
  final $Res Function(GetProjectState) _then;

  @override
  $Res call({
    Object allProjects = freezed,
    Object joinProjects = freezed,
    Object myProject = freezed,
  }) {
    return _then(_value.copyWith(
      allProjects: allProjects == freezed
          ? _value.allProjects
          : allProjects as List<Project>,
      joinProjects: joinProjects == freezed
          ? _value.joinProjects
          : joinProjects as List<Project>,
      myProject:
          myProject == freezed ? _value.myProject : myProject as List<Project>,
    ));
  }
}

/// @nodoc
abstract class _$GetProjectStateCopyWith<$Res>
    implements $GetProjectStateCopyWith<$Res> {
  factory _$GetProjectStateCopyWith(
          _GetProjectState value, $Res Function(_GetProjectState) then) =
      __$GetProjectStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Project> allProjects,
      List<Project> joinProjects,
      List<Project> myProject});
}

/// @nodoc
class __$GetProjectStateCopyWithImpl<$Res>
    extends _$GetProjectStateCopyWithImpl<$Res>
    implements _$GetProjectStateCopyWith<$Res> {
  __$GetProjectStateCopyWithImpl(
      _GetProjectState _value, $Res Function(_GetProjectState) _then)
      : super(_value, (v) => _then(v as _GetProjectState));

  @override
  _GetProjectState get _value => super._value as _GetProjectState;

  @override
  $Res call({
    Object allProjects = freezed,
    Object joinProjects = freezed,
    Object myProject = freezed,
  }) {
    return _then(_GetProjectState(
      allProjects: allProjects == freezed
          ? _value.allProjects
          : allProjects as List<Project>,
      joinProjects: joinProjects == freezed
          ? _value.joinProjects
          : joinProjects as List<Project>,
      myProject:
          myProject == freezed ? _value.myProject : myProject as List<Project>,
    ));
  }
}

/// @nodoc
class _$_GetProjectState implements _GetProjectState {
  _$_GetProjectState({this.allProjects, this.joinProjects, this.myProject});

  @override
  final List<Project> allProjects;
  @override
  final List<Project> joinProjects;
  @override
  final List<Project> myProject;

  @override
  String toString() {
    return 'GetProjectState(allProjects: $allProjects, joinProjects: $joinProjects, myProject: $myProject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetProjectState &&
            (identical(other.allProjects, allProjects) ||
                const DeepCollectionEquality()
                    .equals(other.allProjects, allProjects)) &&
            (identical(other.joinProjects, joinProjects) ||
                const DeepCollectionEquality()
                    .equals(other.joinProjects, joinProjects)) &&
            (identical(other.myProject, myProject) ||
                const DeepCollectionEquality()
                    .equals(other.myProject, myProject)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(allProjects) ^
      const DeepCollectionEquality().hash(joinProjects) ^
      const DeepCollectionEquality().hash(myProject);

  @JsonKey(ignore: true)
  @override
  _$GetProjectStateCopyWith<_GetProjectState> get copyWith =>
      __$GetProjectStateCopyWithImpl<_GetProjectState>(this, _$identity);
}

abstract class _GetProjectState implements GetProjectState {
  factory _GetProjectState(
      {List<Project> allProjects,
      List<Project> joinProjects,
      List<Project> myProject}) = _$_GetProjectState;

  @override
  List<Project> get allProjects;
  @override
  List<Project> get joinProjects;
  @override
  List<Project> get myProject;
  @override
  @JsonKey(ignore: true)
  _$GetProjectStateCopyWith<_GetProjectState> get copyWith;
}
