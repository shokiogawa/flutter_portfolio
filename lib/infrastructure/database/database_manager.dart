import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/domain/value_object/user.dart';
import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseManager {
  //cloud_firestoreのなかに保存するため、インスタンス作成。
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //dbからuserがおるかおらんかを判断する。
  Future<bool> searchUserInDb(auth.User firebaseUser) async {
    //userドキュメントの中にあるuserIdが一致しているuserがいればその数がかえってくる。
    final query = await _db
        .collection("users")
        .where("userId", isEqualTo: firebaseUser.uid)
        .get();
    if (query.docs.length > 0) {
      return true;
    }
    return false;
  }

  //新規ユーザーはデータベースに保存
  Future<void> insertUserToDb(User user) async {
    await _db.collection("users").doc(user.userId).set(user.toMap());
  }

  //データベースからユーザー情報を取得
  Future<User> getUserInfoFromDb(String uid) async {
    final query =
        await _db.collection("users").where("userId", isEqualTo: uid).get();
    return User.fromMap(query.docs[0].data());
  }

  Future<String> uploadImageToStorage(File imageFile, String storageId) async {
    //storage上のファイルの保存場所のリファレンスを取得。
    final storageRef = FirebaseStorage.instance.ref().child(storageId);
    //ファイルをアップロード
    final uploadProject = storageRef.putFile(imageFile);
    //ファイルのアップロードが完了したら、ダウンロードURLを取得。
    return await uploadProject.then((value) => value.ref.getDownloadURL());
  }

  //project1データ保存
  Future<void> insertProject(Project project) async {
    await _db
        .collection("projects")
        .doc(project.projectId)
        .set(project.toMap());
  }

  Future<List<Project>> getProject() async {
    final _query = await _db.collection("projects").get();
    print(_query.docs.length.toString());
    if (_query.docs.length == 0) return List<Project>();
    var projects = List<Project>();
    await _db.collection("projects").get().then((values) => values.docs
        .forEach((value) => projects.add(Project.fromMap(value.data()))));
    return projects;
  }

  Future<List<Project>> getMyProject() async {
    final query = await _db
        .collection("projects")
        .where("userId", isEqualTo: UserRepository.currentUser.userId)
        .get();
    if (query.docs.length == 0) {
      return List<Project>();
    }
    var projects = List<Project>();
    await _db
        .collection("projects")
        .where("userId", isEqualTo: UserRepository.currentUser.userId)
        .get()
        .then((myProjects) => myProjects.docs.forEach((myProject) {
              projects.add(Project.fromMap(myProject.data()));
            }));
    return projects;
  }

//全てのプロジェクト取得

}
