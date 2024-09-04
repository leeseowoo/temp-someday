import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/my_page/data/repository/group_manage_repository_impl.dart';
import 'package:someday/my_page/domain/model/group_info_state.dart';
import 'package:someday/my_page/domain/repository/group_manage_repository.dart';

final getGroupInfoUseCaseProvider = Provider<GetGroupInfoUseCase>((ref) {
  final groupManageRepository = ref.watch(groupManageRepositoryProvider);

  return GetGroupInfoUseCase(groupManageRepository: groupManageRepository);
});

class GetGroupInfoUseCase {
  final GroupManageRepository _groupManageRepository;

  GetGroupInfoUseCase({
    required GroupManageRepository groupManageRepository,
  }) : _groupManageRepository = groupManageRepository;

  Future<GroupInfoState> execute({required groupId}) async {
    return await _groupManageRepository.getGroupInfo(groupId: groupId);
  }
}
