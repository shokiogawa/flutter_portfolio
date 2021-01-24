import 'package:communitygetandpost/domain/value_object/user.dart' as user;
import 'package:communitygetandpost/infrastructure/database/database_manager.dart';
import 'package:communitygetandpost/secret.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserRepository {
  final DatabaseManager databaseManager;

  UserRepository(this.databaseManager);

  static user.User currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TwitterLogin _twitterLogin = TwitterLogin(
      consumerKey: productApiKey,
      consumerSecret: productSecretKey);

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<bool> isSignIn() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      currentUser = await databaseManager.getUserInfoFromDb(firebaseUser.uid);
      return true;
    }
    return false;
  }

  //googleサインイン
  Future<bool> signInGoogle() async {
    try {
      GoogleSignInAccount signInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication signInAuthentication =
          await signInAccount.authentication;

      //認証情報からfirebase認証に必要な信用状を取得
      final auth.GoogleAuthCredential credential =
          auth.GoogleAuthProvider.credential(
        accessToken: signInAuthentication.accessToken,
        idToken: signInAuthentication.idToken,
      );
      //認証されたユーザー情報を取得
      final firebaseUser = (await _auth.signInWithCredential(credential)).user;
      if (firebaseUser == null) {
        return false;
      }

      //DBにユーザーを保存
      ////DBにユーザーがいるかを確認してくる。
      final isUserExistedInDb =
          await databaseManager.searchUserInDb(firebaseUser);
      if (!isUserExistedInDb) {
        //firebaseuserの方を自分で作ったUserの方に変換してdbに保存。
        await databaseManager.insertUserToDb(_convertUser(firebaseUser));
      }
      currentUser = await databaseManager.getUserInfoFromDb(firebaseUser.uid);
      return true;
    } catch (error) {}
    return false;
  }

  //Twitterサインイン
  Future<bool> signInTwitter() async {
    try {
      TwitterLoginResult loginResult = await _twitterLogin.authorize();
      final TwitterSession twitterSession = loginResult.session;
      final auth.AuthCredential twitterAuthCredential =
          auth.TwitterAuthProvider.credential(
              accessToken: twitterSession.token, secret: twitterSession.secret);
      //twitterのcredentialでログイン
      final firebaseUser =
          (await _auth.signInWithCredential(twitterAuthCredential)).user;
      if (firebaseUser == null) {
        return false;
      }
      final isUserExistedInDb =
          await databaseManager.searchUserInDb(firebaseUser);
      if (!isUserExistedInDb) {
        await databaseManager.insertUserToDb(_convertUser(firebaseUser));
      }
      currentUser = await databaseManager.getUserInfoFromDb(firebaseUser.uid);
      return true;
    } catch (error) {
      print("user_repository:twitterのsignIn" + error);
      return false;
    }
  }

  _convertUser(auth.User firebaseUser) {
    return user.User(
        userId: firebaseUser.uid,
        displayName: firebaseUser.displayName,
        inAppUserName: firebaseUser.displayName,
        photoUrl: firebaseUser.photoURL,
        email: firebaseUser.email,
        profile: "");
  }
}
