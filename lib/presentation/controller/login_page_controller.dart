import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';

class LoginPageController {
  final UserRepository userRepository;

  LoginPageController(this.userRepository);

  Future<bool> isSignIn() async{
    return await userRepository.isSignIn();
  }

  Future<void>signInGoogle()async{
    await userRepository.signInGoogle();
  }

  Future<void> signInTwitter()async{
    await userRepository.signInTwitter();
  }

  Future<void> logOut()async{
    await userRepository.signOut();
  }
}
