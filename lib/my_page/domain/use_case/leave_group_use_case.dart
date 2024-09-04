import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/my_page/data/repository/user_info_repository_impl.dart';
import 'package:someday/my_page/domain/repository/user_info_repository.dart';

final leaveGroupUseCaseProvider = Provider<LeaveGroupUseCase>(
  (ref) {
    final repository = ref.watch(userInfoRepositoryProvider);
    return LeaveGroupUseCase(
      repository: repository,
    );
  },
);

class LeaveGroupUseCase {
  final UserInfoRepository _repository;

  LeaveGroupUseCase({
    required UserInfoRepository repository,
  }) : _repository = repository;

  Future<void> execute(
      {required final String groupId,
      required final String userId,
      required final Map<String, dynamic> userInfo}) async {
    await _repository.leaveGroup(
        groupId: groupId, userId: userId, userInfo: userInfo);
  }
}
