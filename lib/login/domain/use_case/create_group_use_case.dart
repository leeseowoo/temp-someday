import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/login/data/repository/group_repository_impl.dart';
import 'package:someday/login/domain/repository/group_repository.dart';

final createGroupUseCaseProvider = Provider<CreateGroupUseCase>(
  (ref) => CreateGroupUseCase(
    groupRepository: ref.watch(groupRepositoryProvider),
  ),
);

class CreateGroupUseCase {
  final GroupRepository _groupRepository;

  CreateGroupUseCase({required GroupRepository groupRepository})
      : _groupRepository = groupRepository;

  Future<bool> execute({
    required final String groupName,
    required final String nickname,
  }) async {
    return await _groupRepository.createGroup(
      groupName: groupName,
      nickname: nickname,
    );
  }
}
