abstract interface class LoginRepository {
  Future<bool> loginWithKakao();

  Future<bool> loginWithGoogle();

  Future<bool> loginWithApple();

  Future<bool> checkUserGroup();
}