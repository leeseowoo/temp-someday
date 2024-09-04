import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/login/domain/use_case/create_group_use_case.dart';

final groupCreationViewModelProvider = Provider<GroupCreationViewModel>(
  (ref) => GroupCreationViewModel(
    createGroupUseCase: ref.watch(createGroupUseCaseProvider),
  ),
);

class GroupCreationViewModel {
  final CreateGroupUseCase _createGroupUseCase;

  GroupCreationViewModel({required CreateGroupUseCase createGroupUseCase})
      : _createGroupUseCase = createGroupUseCase;

  Future<bool> createGroup(
    final String groupName,
    final String nickname,
  ) async {
    return await _createGroupUseCase.execute(
      groupName: groupName,
      nickname: nickname,
    );
  }
}
