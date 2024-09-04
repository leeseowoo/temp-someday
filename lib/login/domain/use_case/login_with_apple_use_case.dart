import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/login/data/repository/login_repository_impl.dart';
import 'package:someday/login/domain/repository/login_repository.dart';

final loginWithAppleUseCaseProvider = Provider<LoginWithAppleUseCase>(
  (ref) => LoginWithAppleUseCase(
    loginRepository: ref.watch(loginRepositoryProvider),
  ),
);

class LoginWithAppleUseCase {
  final LoginRepository _loginRepository;

  LoginWithAppleUseCase({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  Future<bool> execute() async {
    return await _loginRepository.loginWithApple();
  }
}
