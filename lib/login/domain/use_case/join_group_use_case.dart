import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/login/data/repository/group_repository_impl.dart';
import 'package:someday/login/domain/repository/group_repository.dart';

final joinGroupUseCaseProvider = Provider<JoinGroupUseCase>(
  (ref) => JoinGroupUseCase(
    groupRepository: ref.watch(groupRepositoryProvider),
  ),
);

class JoinGroupUseCase {
  final GroupRepository _groupRepository;

  JoinGroupUseCase({required GroupRepository groupRepository})
      : _groupRepository = groupRepository;

  Future<bool> execute({
    required final String groupCode,
    required final String nickname,
  }) async {
    return await _groupRepository.joinGroup(
      groupCode: groupCode,
      nickname: nickname,
    );
  }
}
