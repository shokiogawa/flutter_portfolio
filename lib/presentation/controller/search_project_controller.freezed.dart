// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_project_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SearchProjectStateTearOff {
  const _$SearchProjectStateTearOff();

// ignore: unused_element
  _SearchProjectState call({List<Project> searcedProject}) {
    return _SearchProjectState(
      searcedProject: searcedProject,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SearchProjectState = _$SearchProjectStateTearOff();

/// @nodoc
mixin _$SearchProjectState {
  List<Project> get searcedProject;

  @JsonKey(ignore: true)
  $SearchProjectStateCopyWith<SearchProjectState> get copyWith;
}

/// @nodoc
abstract class $SearchProjectStateCopyWith<$Res> {
  factory $SearchProjectStateCopyWith(
          SearchProjectState value, $Res Function(SearchProjectState) then) =
      _$SearchProjectStateCopyWithImpl<$Res>;
  $Res call({List<Project> searcedProject});
}

/// @nodoc
class _$SearchProjectStateCopyWithImpl<$Res>
    implements $SearchProjectStateCopyWith<$Res> {
  _$SearchProjectStateCopyWithImpl(this._value, this._then);

  final SearchProjectState _value;
  // ignore: unused_field
  final $Res Function(SearchProjectState) _then;

  @override
  $Res call({
    Object searcedProject = freezed,
  }) {
    return _then(_value.copyWith(
      searcedProject: searcedProject == freezed
          ? _value.searcedProject
          : searcedProject as List<Project>,
    ));
  }
}

/// @nodoc
abstract class _$SearchProjectStateCopyWith<$Res>
    implements $SearchProjectStateCopyWith<$Res> {
  factory _$SearchProjectStateCopyWith(
          _SearchProjectState value, $Res Function(_SearchProjectState) then) =
      __$SearchProjectStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Project> searcedProject});
}

/// @nodoc
class __$SearchProjectStateCopyWithImpl<$Res>
    extends _$SearchProjectStateCopyWithImpl<$Res>
    implements _$SearchProjectStateCopyWith<$Res> {
  __$SearchProjectStateCopyWithImpl(
      _SearchProjectState _value, $Res Function(_SearchProjectState) _then)
      : super(_value, (v) => _then(v as _SearchProjectState));

  @override
  _SearchProjectState get _value => super._value as _SearchProjectState;

  @override
  $Res call({
    Object searcedProject = freezed,
  }) {
    return _then(_SearchProjectState(
      searcedProject: searcedProject == freezed
          ? _value.searcedProject
          : searcedProject as List<Project>,
    ));
  }
}

/// @nodoc
class _$_SearchProjectState implements _SearchProjectState {
  _$_SearchProjectState({this.searcedProject});

  @override
  final List<Project> searcedProject;

  @override
  String toString() {
    return 'SearchProjectState(searcedProject: $searcedProject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchProjectState &&
            (identical(other.searcedProject, searcedProject) ||
                const DeepCollectionEquality()
                    .equals(other.searcedProject, searcedProject)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searcedProject);

  @JsonKey(ignore: true)
  @override
  _$SearchProjectStateCopyWith<_SearchProjectState> get copyWith =>
      __$SearchProjectStateCopyWithImpl<_SearchProjectState>(this, _$identity);
}

abstract class _SearchProjectState implements SearchProjectState {
  factory _SearchProjectState({List<Project> searcedProject}) =
      _$_SearchProjectState;

  @override
  List<Project> get searcedProject;
  @override
  @JsonKey(ignore: true)
  _$SearchProjectStateCopyWith<_SearchProjectState> get copyWith;
}
