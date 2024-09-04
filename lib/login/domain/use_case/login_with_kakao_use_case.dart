import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/login/data/repository/login_repository_impl.dart';
import 'package:someday/login/domain/repository/login_repository.dart';

final loginWithKaKaoUseCaseProvider = Provider<LoginWithKakaoUseCase>(
      (ref) => LoginWithKakaoUseCase(
    loginRepository: ref.watch(loginRepositoryProvider),
  ),
);

class LoginWithKakaoUseCase {
  final LoginRepository _loginRepository;

  LoginWithKakaoUseCase({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  Future<bool> execute() async {
    return await _loginRepository.loginWithKakao();
  }
}
