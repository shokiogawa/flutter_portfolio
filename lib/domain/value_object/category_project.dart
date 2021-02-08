import 'package:flutter/material.dart';

class CategoryProject{
  String projectId;
  String userId;
  int categoryId;
  String projectName;
  String projectExplanation;
  String imageUrl;
  String imageStoragePath;
  int participantNumber;
  DateTime postDateTime;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  CategoryProject({
    @required this.projectId,
    @required this.userId,
    @required this.categoryId,
    @required this.projectName,
    @required this.projectExplanation,
    @required this.imageUrl,
    @required this.imageStoragePath,
    @required this.participantNumber,
    @required this.postDateTime,
  });

  CategoryProject copyWith({
    String projectId,
    String userId,
    int categoryId,
    String projectName,
    String projectExplanation,
    String imageUrl,
    String imageStoragePath,
    int participantNumber,
    DateTime postDateTime,
  }) {
    return new CategoryProject(
      projectId: projectId ?? this.projectId,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      projectName: projectName ?? this.projectName,
      projectExplanation: projectExplanation ?? this.projectExplanation,
      imageUrl: imageUrl ?? this.imageUrl,
      imageStoragePath: imageStoragePath ?? this.imageStoragePath,
      participantNumber: participantNumber ?? this.participantNumber,
      postDateTime: postDateTime ?? this.postDateTime,
    );
  }

  @override
  String toString() {
    return 'CategoryProject{projectId: $projectId, userId: $userId, categoryId: $categoryId, projectName: $projectName, projectExplanation: $projectExplanation, imageUrl: $imageUrl, imageStoragePath: $imageStoragePath, participantNumber: $participantNumber, postDateTime: $postDateTime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryProject &&
          runtimeType == other.runtimeType &&
          projectId == other.projectId &&
          userId == other.userId &&
          categoryId == other.categoryId &&
          projectName == other.projectName &&
          projectExplanation == other.projectExplanation &&
          imageUrl == other.imageUrl &&
          imageStoragePath == other.imageStoragePath &&
          participantNumber == other.participantNumber &&
          postDateTime == other.postDateTime);

  @override
  int get hashCode =>
      projectId.hashCode ^
      userId.hashCode ^
      categoryId.hashCode ^
      projectName.hashCode ^
      projectExplanation.hashCode ^
      imageUrl.hashCode ^
      imageStoragePath.hashCode ^
      participantNumber.hashCode ^
      postDateTime.hashCode;

  factory CategoryProject.fromMap(Map<String, dynamic> map) {
    return new CategoryProject(
      projectId: map['projectId'] as String,
      userId: map['userId'] as String,
      categoryId: map['categoryId'] as int,
      projectName: map['projectName'] as String,
      projectExplanation: map['projectExplanation'] as String,
      imageUrl: map['imageUrl'] as String,
      imageStoragePath: map['imageStoragePath'] as String,
      participantNumber: map['participantNumber'] as int,
      postDateTime: map['postDateTime'] as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'projectId': this.projectId,
      'userId': this.userId,
      'categoryId': this.categoryId,
      'projectName': this.projectName,
      'projectExplanation': this.projectExplanation,
      'imageUrl': this.imageUrl,
      'imageStoragePath': this.imageStoragePath,
      'participantNumber': this.participantNumber,
      'postDateTime': this.postDateTime,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}