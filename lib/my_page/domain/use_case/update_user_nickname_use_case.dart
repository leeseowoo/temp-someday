import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/my_page/data/repository/user_info_repository_impl.dart';
import 'package:someday/my_page/domain/repository/user_info_repository.dart';

final updateUserNicknameUseCaseProvider = Provider<UpdateUserNicknameUseCase>(
  (ref) {
    final repository = ref.watch(userInfoRepositoryProvider);

    return UpdateUserNicknameUseCase(
    repository: repository,
  );
  },
);

class UpdateUserNicknameUseCase {
  final UserInfoRepository _repository;

  UpdateUserNicknameUseCase({
    required UserInfoRepository repository,
  }) : _repository = repository;

  Future<void> execute(
      {required String userId, required String newNickname}) async {
    return await _repository.updateUserNickname(
        userId: userId, newNickname: newNickname);
  }

}
