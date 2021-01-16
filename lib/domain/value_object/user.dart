import 'package:flutter/material.dart';

class User{
  final String userId;
  final String displayName;
  final String inAppUserName;
  final String photoUrl;
  final String email;
  final String profile;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const User({
    @required this.userId,
    @required this.displayName,
    @required this.inAppUserName,
    @required this.photoUrl,
    @required this.email,
    @required this.profile,
  });

  User copyWith({
    String userId,
    String displayName,
    String inAppUserName,
    String photoUrl,
    String email,
    String profile,
  }) {
    if ((userId == null || identical(userId, this.userId)) &&
        (displayName == null || identical(displayName, this.displayName)) &&
        (inAppUserName == null ||
            identical(inAppUserName, this.inAppUserName)) &&
        (photoUrl == null || identical(photoUrl, this.photoUrl)) &&
        (email == null || identical(email, this.email)) &&
        (profile == null || identical(profile, this.profile))) {
      return this;
    }

    return new User(
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      inAppUserName: inAppUserName ?? this.inAppUserName,
      photoUrl: photoUrl ?? this.photoUrl,
      email: email ?? this.email,
      profile: profile ?? this.profile,
    );
  }

  @override
  String toString() {
    return 'User{userId: $userId, displayName: $displayName, inAppUserName: $inAppUserName, photoUrl: $photoUrl, email: $email, profile: $profile}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          displayName == other.displayName &&
          inAppUserName == other.inAppUserName &&
          photoUrl == other.photoUrl &&
          email == other.email &&
          profile == other.profile);

  @override
  int get hashCode =>
      userId.hashCode ^
      displayName.hashCode ^
      inAppUserName.hashCode ^
      photoUrl.hashCode ^
      email.hashCode ^
      profile.hashCode;

  factory User.fromMap(Map<String, dynamic> map) {
    return new User(
      userId: map['userId'] as String,
      displayName: map['displayName'] as String,
      inAppUserName: map['inAppUserName'] as String,
      photoUrl: map['photoUrl'] as String,
      email: map['email'] as String,
      profile: map['profile'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'userId': this.userId,
      'displayName': this.displayName,
      'inAppUserName': this.inAppUserName,
      'photoUrl': this.photoUrl,
      'email': this.email,
      'profile': this.profile,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}