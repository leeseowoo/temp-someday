import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/login/data/repository/login_repository_impl.dart';
import 'package:someday/login/domain/repository/login_repository.dart';

final checkUserGroupUseCaseProvider = Provider<CheckUserGroupUseCase>(
  (ref) => CheckUserGroupUseCase(
    loginRepository: ref.watch(loginRepositoryProvider),
  ),
);

class CheckUserGroupUseCase {
  final LoginRepository _loginRepository;

  CheckUserGroupUseCase({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  Future<bool> execute() async {
    return await _loginRepository.checkUserGroup();
  }
}
