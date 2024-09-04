import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/my_page/domain/model/group_info_state.dart';
import 'package:someday/my_page/domain/use_case/get_group_info_use_case.dart';

final groupStateProvider =
    StateNotifierProvider<GroupStateNotifier, GroupInfoState>((ref) {
      final getGroupInfoUseCase = ref.watch(getGroupInfoUseCaseProvider);

  return GroupStateNotifier(getGroupInfoUseCase: getGroupInfoUseCase);
});

class GroupStateNotifier extends StateNotifier<GroupInfoState> {
  final GetGroupInfoUseCase _getGroupInfoUseCase;

  GroupStateNotifier({required GetGroupInfoUseCase getGroupInfoUseCase})
      : _getGroupInfoUseCase = getGroupInfoUseCase,
        super(const GroupInfoState(name: '', leaderNickname: '', members: []));

  Future<void> getGroupInfo({required groupId}) async {
    try {
      final groupInfo = await _getGroupInfoUseCase.execute(groupId: groupId);
      state = groupInfo;
    } catch (e) {
      state = state.copyWith(isFetchFailed: true);
    } finally {
      state = state.copyWith(isFetchFailed: false);
    }
  }
}
