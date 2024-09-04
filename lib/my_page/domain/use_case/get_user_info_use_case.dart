import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/my_page/data/repository/user_info_repository_impl.dart';
import 'package:someday/my_page/domain/model/user_state.dart';
import 'package:someday/my_page/domain/repository/user_info_repository.dart';

final getUserInfoUseCaseProvider = Provider<GetUserInfoUseCase>(
  (ref) {
    final repository = ref.watch(userInfoRepositoryProvider);
    return GetUserInfoUseCase(
    repository: repository,
  );
  },
);

class GetUserInfoUseCase {
  final UserInfoRepository _repository;

  GetUserInfoUseCase({
    required UserInfoRepository repository,
  }) : _repository = repository;

  Future<UserState> execute({required String userId}) async {
    return await _repository.getUserInfo(userId: userId);
  }

}
