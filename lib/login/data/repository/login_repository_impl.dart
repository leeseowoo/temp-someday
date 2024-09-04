import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/login/data/data_source/login_data_source.dart';
import 'package:someday/login/domain/repository/login_repository.dart';

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepositoryImpl(
    loginDataSource: ref.watch(loginDataSourceProvider),
  ),
);

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryImpl({
    required LoginDataSource loginDataSource,
  }) : _loginDataSource = loginDataSource;

  @override
  Future<bool> loginWithKakao() async{
    return await _loginDataSource.loginWithKakao();
  }

  @override
  Future<bool> loginWithGoogle() async {
    return await _loginDataSource.loginWithGoogle();
  }

  @override
  Future<bool> loginWithApple() async {
    return await _loginDataSource.loginWithApple();
  }

  @override
  Future<bool> checkUserGroup() async {
    return await _loginDataSource.checkUserGroup();
  }
}
