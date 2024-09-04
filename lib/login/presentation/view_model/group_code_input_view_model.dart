import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/login/domain/use_case/join_group_use_case.dart';

final groupCodeInputViewModelProvider = Provider<GroupCodeInputViewModel>(
  (ref) => GroupCodeInputViewModel(
    joinGroupUseCase: ref.watch(joinGroupUseCaseProvider),
  ),
);

class GroupCodeInputViewModel {
  final JoinGroupUseCase _joinGroupUseCase;

  GroupCodeInputViewModel({required JoinGroupUseCase joinGroupUseCase})
      : _joinGroupUseCase = joinGroupUseCase;

  Future<bool> joinGroup({
    required final String groupCode,
    required final String nickname,
  }) async {
    return await _joinGroupUseCase.execute(
      groupCode: groupCode,
      nickname: nickname,
    );
  }
}
