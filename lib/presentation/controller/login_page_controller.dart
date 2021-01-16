import 'package:communitygetandpost/infrastructure/repository/user_repository.dart';

class LoginPageController {
  final UserRepository userRepository;

  LoginPageController(this.userRepository);

  Future<bool> isSignIn() async{
    return await userRepository.isSignIn();
  }
}
