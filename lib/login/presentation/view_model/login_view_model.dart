import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/login/domain/use_case/check_user_group_use_case.dart';
import 'package:someday/login/domain/use_case/login_with_apple_use_case.dart';
import 'package:someday/login/domain/use_case/login_with_google_use_case.dart';
import 'package:someday/login/domain/use_case/login_with_kakao_use_case.dart';

final loginViewModelProvider = Provider<LoginViewModel>(
  (ref) => LoginViewModel(
    loginWithKakaoUseCase: ref.watch(loginWithKaKaoUseCaseProvider),
    loginWithGoogleUseCase: ref.watch(loginWithGoogleUseCaseProvider),
    loginWithAppleUseCase: ref.watch(loginWithAppleUseCaseProvider),
    checkUserGroupUseCase: ref.watch(checkUserGroupUseCaseProvider),
  ),
);

class LoginViewModel {
  final LoginWithKakaoUseCase _loginWithKakaoUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  final LoginWithAppleUseCase _loginWithAppleUseCase;
  final CheckUserGroupUseCase _checkUserGroupUseCase;

  LoginViewModel({
    required LoginWithKakaoUseCase loginWithKakaoUseCase,
    required LoginWithGoogleUseCase loginWithGoogleUseCase,
    required LoginWithAppleUseCase loginWithAppleUseCase,
    required CheckUserGroupUseCase checkUserGroupUseCase,
  })  : _loginWithKakaoUseCase = loginWithKakaoUseCase,
        _loginWithGoogleUseCase = loginWithGoogleUseCase,
        _loginWithAppleUseCase = loginWithAppleUseCase,
        _checkUserGroupUseCase = checkUserGroupUseCase;

  Future<bool> loginWithKakao() async {
    return await _loginWithKakaoUseCase.execute();
  }

  Future<bool> loginWithGoogle() async {
    return await _loginWithGoogleUseCase.execute();
  }

  Future<bool> loginWithApple() async {
    return await _loginWithAppleUseCase.execute();
  }

  Future<bool> checkUserGroup() async {
    return await _checkUserGroupUseCase.execute();
  }
}
