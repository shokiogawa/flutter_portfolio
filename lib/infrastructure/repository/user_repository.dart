import 'package:communitygetandpost/infrastructure/database/database_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{
final DatabaseManager databaseManager;
UserRepository(this.databaseManager);

final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool>isSignIn() async{
    final firebaseUser =  _auth.currentUser;
    if (firebaseUser != null){
      return true;
    }
    return false;
  }
}