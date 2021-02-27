import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communitygetandpost/domain/value_object/project.dart';
import 'package:communitygetandpost/domain/value_object/user.dart';
import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';
import 'package:communitygetandpost/usecase/read_model/project_category.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';


// final dataBaseManage = Provider((ref)=> DatabaseManager());
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
    print(query.docs[0].data().toString());
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
    await _db.collection("projects").get().then((values) =>
        values.docs
            .forEach((value) => projects.add(Project.fromMap(value.data()))));
    print("databaseのgetproject" + projects.length.toString());
    return  projects;
  }

  Future<List<Project>> getMyProject() async {
    try{
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
          .where("userId", isEqualTo: UserRepository.currentUser.userId).orderBy("postDateTime", descending: false)
          .get()
          .then((myProjects) =>
          myProjects.docs.forEach((myProject) {
            projects.add(Project.fromMap(myProject.data()));
          }));
      print("databaseのgetMyproject");
      return projects;
    }
    catch(error){
      return Future.error(error);
    }

  }


  List<Project> getProjectOnRealtime() {
    var projects = List<Project>();
    final snapshot = _db.collection("projects").snapshots();
    snapshot.listen((snapshot) {
      final docs = snapshot.docs;
      docs.forEach((project) {
        projects.add(Project.fromMap(project.data()));
      }
      );
    });
    return projects;
  }

  Future<int> findNumberOfMember(String projectId, User currentUser) async {
    final _query = await _db.collection("projects").doc(projectId).collection(
        "members").get();
    return _query.docs.length;
  }

  Future<void> joinMemberToProject(String userId, Project project,
      User currentUser) async {
    // var userId;
    final isUserIn = await _db.collection("projects").doc(project.projectId).collection(
        "members").where("userId", isEqualTo: currentUser.userId).get();
    print(isUserIn.docs.length);
    if (isUserIn.docs.length == 0) {
      await _db.collection("projects").doc(project.projectId).collection("members").doc(
          userId).set({"userId": userId});
      await _db.collection("users").doc(userId).collection("joinProjects").doc(project.projectId).set({"projectId": project.projectId, "heldDate": project.postDateTime});
    }
    else {
      print("もういるよ");
    }
  }

  //projectに参加しているmemberを取得
  Future<List<User>> getJoinMembers(String projectId) async {
    final query = await _db.collection("projects").doc(projectId).collection(
        "members").get();
    if (query.docs.length == 0) return List();
    var userIds = List<String>();
    query.docs.forEach((memberId) {
      userIds.add(memberId.data()["userId"]);
    });
    var users = List<User>();
    await Future.forEach(userIds, (userId)async {
      users.add(await getUserInfoFromDb(userId));
    });
    print("userの長さ" + users.length.toString());
    return users;
  }

  Future<bool> identifyInMembers(String projectId, String userId) async{
    final myUserId = await _db.collection("projects").doc(projectId).collection("members").where("userId", isEqualTo: userId).get();
    if(myUserId.docs.length == 0){
      print("true");
      return true;
    }else{
      print("false");
      return false;
    }

  }
  //それぞれのカテゴリーのプロジェクトを取得。
  Future<List<Project>>getCategorizedListProject(int categoryId) async{
    final _query = await _db.collection("projects").where("categoryId", isEqualTo: categoryId).get();
    var categorizedProject = List<Project>();
    if(_query.docs.length == 0){
      print("0ですよ");
      return categorizedProject;
    }
    _query.docs.forEach((project) {
      categorizedProject.add(Project.fromMap(project.data()));
    });
    return categorizedProject;
  }
  
  Future<Project> getProjectByProjectId(String projectId)async{
    final _query = await _db.collection("projects").where("projectId", isEqualTo: projectId).get();
    return Project.fromMap(_query.docs[0].data());
  }

  Future<List<Project>>getJoinedProject(String userId) async{
    try{
      final _query = await _db.collection("users").doc(userId).collection("joinProjects").orderBy("heldDate", descending: false).get();
      print(_query.docs.length);
      if(_query.docs.length == 0){
        return List<Project>();
      }
      var projectIds = List<String>();
      _query.docs.forEach((projectId) {
        projectIds.add(projectId.data()["projectId"]);
      });
      print(projectIds.length);
      var joinProject = List<Project>();
      await Future.forEach(projectIds, (projectId)async {
        joinProject.add(await getProjectByProjectId(projectId));
      });
      print(joinProject.length);
      return joinProject;
    }catch(error){
      return Future.error(error);
    }


  }

  Future<List<Project>>searchProjects(String query) async{
    final _query = await _db.collection("projects").orderBy("projectName").startAt([query]).endAt([query + "\uf8ff"]).get();
    if (_query.docs.length ==0){
      print("検索結果は0");
      return List<Project>();
    }
    var searchProjects = List<Project>();
    _query.docs.forEach((project) {
      searchProjects.add(Project.fromMap(project.data()));
    });
    print("検索したプロジェクトの個数は" + searchProjects.length.toString());
    return searchProjects;
  }

}
