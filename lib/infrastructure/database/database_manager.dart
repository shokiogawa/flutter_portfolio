import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communitygetandpost/domain/value_object/user.dart';
import 'package:firebase_auth/firebase_auth.dart'as auth;

class DatabaseManager{
  //cloud_firestoreのなかに保存するため、インスタンス作成。
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //dbからuserがおるかおらんかを判断する。
  Future<bool>searchUserInDb(auth.User firebaseUser)  async{
    //userドキュメントの中にあるuserIdが一致しているuserがいればその数がかえってくる。
    final query = await _db.collection("users").where("userId", isEqualTo: firebaseUser.uid).get();
    if (query.docs.length > 0){
      return true;
    }
    return false;
  }

  //新規ユーザーはデータベースに保存
  Future<void> insertUserToDb(User user) async{
    await _db.collection("users").doc(user.userId).set(user.toMap());
  }

  //データベースからユーザー情報を取得
  Future<User> getUserInfoFromDb(String uid) async{
    final query = await _db.collection("users").where("userId", isEqualTo: uid).get();
    return User.fromMap(query.docs[0].data());
  }

}