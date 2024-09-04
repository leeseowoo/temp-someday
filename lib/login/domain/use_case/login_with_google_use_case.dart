import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/login/data/repository/login_repository_impl.dart';
import 'package:someday/login/domain/repository/login_repository.dart';

final loginWithGoogleUseCaseProvider = Provider<LoginWithGoogleUseCase>(
  (ref) => LoginWithGoogleUseCase(
    loginRepository: ref.watch(loginRepositoryProvider),
  ),
);

class LoginWithGoogleUseCase {
  final LoginRepository _loginRepository;

  LoginWithGoogleUseCase({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  Future<bool> execute() async {
    return await _loginRepository.loginWithGoogle();
  }
}
