import 'package:flutter/material.dart';

class Project {
  String projectId;
  String userId;
  String projectName;
  String projectExplanation;
  String imageUrl;
  String imageStoragePath;
  int participantNumber;
  DateTime postDateTime;
  int categoryId;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Project({
    @required this.projectId,
    @required this.userId,
    @required this.projectName,
    @required this.projectExplanation,
    @required this.imageUrl,
    @required this.imageStoragePath,
    @required this.participantNumber,
    @required this.postDateTime,
    @required this.categoryId,
  });

  Project copyWith({
    String projectId,
    String userId,
    String projectName,
    String projectExplanation,
    String imageUrl,
    String imageStoragePath,
    int participantNumber,
    DateTime postDateTime,
    int categoryId,
  }) {
    return new Project(
      projectId: projectId ?? this.projectId,
      userId: userId ?? this.userId,
      projectName: projectName ?? this.projectName,
      projectExplanation: projectExplanation ?? this.projectExplanation,
      imageUrl: imageUrl ?? this.imageUrl,
      imageStoragePath: imageStoragePath ?? this.imageStoragePath,
      participantNumber: participantNumber ?? this.participantNumber,
      postDateTime: postDateTime ?? this.postDateTime,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  String toString() {
    return 'Project{projectId: $projectId, userId: $userId, projectName: $projectName, projectExplanation: $projectExplanation, imageUrl: $imageUrl, imageStoragePath: $imageStoragePath, participantNumber: $participantNumber, postDateTime: $postDateTime, categoryId: $categoryId}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          runtimeType == other.runtimeType &&
          projectId == other.projectId &&
          userId == other.userId &&
          projectName == other.projectName &&
          projectExplanation == other.projectExplanation &&
          imageUrl == other.imageUrl &&
          imageStoragePath == other.imageStoragePath &&
          participantNumber == other.participantNumber &&
          postDateTime == other.postDateTime &&
          categoryId == other.categoryId);

  @override
  int get hashCode =>
      projectId.hashCode ^
      userId.hashCode ^
      projectName.hashCode ^
      projectExplanation.hashCode ^
      imageUrl.hashCode ^
      imageStoragePath.hashCode ^
      participantNumber.hashCode ^
      postDateTime.hashCode ^
      categoryId.hashCode;

  factory Project.fromMap(Map<String, dynamic> map) {
    return new Project(
      projectId: map['projectId'] as String,
      userId: map['userId'] as String,
      projectName: map['projectName'] as String,
      projectExplanation: map['projectExplanation'] as String,
      imageUrl: map['imageUrl'] as String,
      imageStoragePath: map['imageStoragePath'] as String,
      participantNumber: map['participantNumber'] as int,
      postDateTime: map['postDateTime'] == null
          ? null
          : DateTime.parse(map['postDateTime'] as String),
      categoryId: map['categoryId'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'projectId': this.projectId,
      'userId': this.userId,
      'projectName': this.projectName,
      'projectExplanation': this.projectExplanation,
      'imageUrl': this.imageUrl,
      'imageStoragePath': this.imageStoragePath,
      'participantNumber': this.participantNumber,
      'postDateTime': this.postDateTime.toIso8601String(),
      'categoryId': this.categoryId,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
