// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'new_post_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProjectStateTearOff {
  const _$ProjectStateTearOff();

// ignore: unused_element
  _ProjectState call(
      {String projectName,
      String projectExplanation,
      String imageUrl,
      int participantNumber,
      User hostUser,
      DateTime projectOpenTime}) {
    return _ProjectState(
      projectName: projectName,
      projectExplanation: projectExplanation,
      imageUrl: imageUrl,
      participantNumber: participantNumber,
      hostUser: hostUser,
      projectOpenTime: projectOpenTime,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProjectState = _$ProjectStateTearOff();

/// @nodoc
mixin _$ProjectState {
  String get projectName;
  String get projectExplanation;
  String get imageUrl;
  int get participantNumber;
  User get hostUser;
  DateTime get projectOpenTime;

  $ProjectStateCopyWith<ProjectState> get copyWith;
}

/// @nodoc
abstract class $ProjectStateCopyWith<$Res> {
  factory $ProjectStateCopyWith(
          ProjectState value, $Res Function(ProjectState) then) =
      _$ProjectStateCopyWithImpl<$Res>;
  $Res call(
      {String projectName,
      String projectExplanation,
      String imageUrl,
      int participantNumber,
      User hostUser,
      DateTime projectOpenTime});
}

/// @nodoc
class _$ProjectStateCopyWithImpl<$Res> implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._value, this._then);

  final ProjectState _value;
  // ignore: unused_field
  final $Res Function(ProjectState) _then;

  @override
  $Res call({
    Object projectName = freezed,
    Object projectExplanation = freezed,
    Object imageUrl = freezed,
    Object participantNumber = freezed,
    Object hostUser = freezed,
    Object projectOpenTime = freezed,
  }) {
    return _then(_value.copyWith(
      projectName:
          projectName == freezed ? _value.projectName : projectName as String,
      projectExplanation: projectExplanation == freezed
          ? _value.projectExplanation
          : projectExplanation as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      participantNumber: participantNumber == freezed
          ? _value.participantNumber
          : participantNumber as int,
      hostUser: hostUser == freezed ? _value.hostUser : hostUser as User,
      projectOpenTime: projectOpenTime == freezed
          ? _value.projectOpenTime
          : projectOpenTime as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ProjectStateCopyWith<$Res>
    implements $ProjectStateCopyWith<$Res> {
  factory _$ProjectStateCopyWith(
          _ProjectState value, $Res Function(_ProjectState) then) =
      __$ProjectStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String projectName,
      String projectExplanation,
      String imageUrl,
      int participantNumber,
      User hostUser,
      DateTime projectOpenTime});
}

/// @nodoc
class __$ProjectStateCopyWithImpl<$Res> extends _$ProjectStateCopyWithImpl<$Res>
    implements _$ProjectStateCopyWith<$Res> {
  __$ProjectStateCopyWithImpl(
      _ProjectState _value, $Res Function(_ProjectState) _then)
      : super(_value, (v) => _then(v as _ProjectState));

  @override
  _ProjectState get _value => super._value as _ProjectState;

  @override
  $Res call({
    Object projectName = freezed,
    Object projectExplanation = freezed,
    Object imageUrl = freezed,
    Object participantNumber = freezed,
    Object hostUser = freezed,
    Object projectOpenTime = freezed,
  }) {
    return _then(_ProjectState(
      projectName:
          projectName == freezed ? _value.projectName : projectName as String,
      projectExplanation: projectExplanation == freezed
          ? _value.projectExplanation
          : projectExplanation as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      participantNumber: participantNumber == freezed
          ? _value.participantNumber
          : participantNumber as int,
      hostUser: hostUser == freezed ? _value.hostUser : hostUser as User,
      projectOpenTime: projectOpenTime == freezed
          ? _value.projectOpenTime
          : projectOpenTime as DateTime,
    ));
  }
}

/// @nodoc
class _$_ProjectState implements _ProjectState {
  _$_ProjectState(
      {this.projectName,
      this.projectExplanation,
      this.imageUrl,
      this.participantNumber,
      this.hostUser,
      this.projectOpenTime});

  @override
  final String projectName;
  @override
  final String projectExplanation;
  @override
  final String imageUrl;
  @override
  final int participantNumber;
  @override
  final User hostUser;
  @override
  final DateTime projectOpenTime;

  @override
  String toString() {
    return 'ProjectState(projectName: $projectName, projectExplanation: $projectExplanation, imageUrl: $imageUrl, participantNumber: $participantNumber, hostUser: $hostUser, projectOpenTime: $projectOpenTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProjectState &&
            (identical(other.projectName, projectName) ||
                const DeepCollectionEquality()
                    .equals(other.projectName, projectName)) &&
            (identical(other.projectExplanation, projectExplanation) ||
                const DeepCollectionEquality()
                    .equals(other.projectExplanation, projectExplanation)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.participantNumber, participantNumber) ||
                const DeepCollectionEquality()
                    .equals(other.participantNumber, participantNumber)) &&
            (identical(other.hostUser, hostUser) ||
                const DeepCollectionEquality()
                    .equals(other.hostUser, hostUser)) &&
            (identical(other.projectOpenTime, projectOpenTime) ||
                const DeepCollectionEquality()
                    .equals(other.projectOpenTime, projectOpenTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(projectName) ^
      const DeepCollectionEquality().hash(projectExplanation) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(participantNumber) ^
      const DeepCollectionEquality().hash(hostUser) ^
      const DeepCollectionEquality().hash(projectOpenTime);

  @override
  _$ProjectStateCopyWith<_ProjectState> get copyWith =>
      __$ProjectStateCopyWithImpl<_ProjectState>(this, _$identity);
}

abstract class _ProjectState implements ProjectState {
  factory _ProjectState(
      {String projectName,
      String projectExplanation,
      String imageUrl,
      int participantNumber,
      User hostUser,
      DateTime projectOpenTime}) = _$_ProjectState;

  @override
  String get projectName;
  @override
  String get projectExplanation;
  @override
  String get imageUrl;
  @override
  int get participantNumber;
  @override
  User get hostUser;
  @override
  DateTime get projectOpenTime;
  @override
  _$ProjectStateCopyWith<_ProjectState> get copyWith;
}
