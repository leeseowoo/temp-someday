import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/my_page/data/repository/user_info_repository_impl.dart';
import 'package:someday/my_page/domain/model/user_state.dart';
import 'package:someday/my_page/domain/repository/user_info_repository.dart';
import 'package:someday/my_page/domain/use_case/get_user_info_use_case.dart';
import 'package:someday/my_page/domain/use_case/leave_group_use_case.dart';
import 'package:someday/my_page/domain/use_case/update_user_nickname_use_case.dart';

final userStateProvider = StateNotifierProvider<UserStateNotifier, UserState>(
  (ref) {
    final repository = ref.watch(userInfoRepositoryProvider);
    final getUserInfoUseCase = ref.watch(getUserInfoUseCaseProvider);
    final updateUserNicknameUseCase =
        ref.watch(updateUserNicknameUseCaseProvider);
    final leaveGroupUseCase = ref.watch(leaveGroupUseCaseProvider);

    return UserStateNotifier(
        repository: repository,
        getUserInfoUseCase: getUserInfoUseCase,
        updateUserNicknameUseCase: updateUserNicknameUseCase,
        leaveGroupUsecase: leaveGroupUseCase);
  },
);

class UserStateNotifier extends StateNotifier<UserState> {
  final UserInfoRepository _repository;
  final GetUserInfoUseCase _getUserInfoUseCase;
  final UpdateUserNicknameUseCase _updateUserNicknameUseCase;
  final LeaveGroupUseCase _leaveGroupUseCase;

  UserStateNotifier(
      {required UserInfoRepository repository,
      required GetUserInfoUseCase getUserInfoUseCase,
      required UpdateUserNicknameUseCase updateUserNicknameUseCase,
      required LeaveGroupUseCase leaveGroupUsecase})
      : _repository = repository,
        _getUserInfoUseCase = getUserInfoUseCase,
        _updateUserNicknameUseCase = updateUserNicknameUseCase,
        _leaveGroupUseCase = leaveGroupUsecase,
        super(const UserState(isLoading: true));

  Future<void> getUserInfo({required String userId}) async {
    try {
      final result = await _getUserInfoUseCase.execute(userId: userId);
      final isLeader =
          await _checkLeader(groupId: result.groupId, userId: userId);
      final data = result.copyWith(isLeader: isLeader);
      state = data;
    } catch (e) {
      state = state.copyWith(isLoading: false, isFetchFailed: true);
    }
  }

  Future<void> updateUserNickname(
      {required String userId, required String newNickname}) async {
    try {
      await _updateUserNicknameUseCase.execute(
          userId: userId, newNickname: newNickname);
      state = state.copyWith(nickname: newNickname);
    } catch (e) {
      state = state.copyWith(isSuccessUpdateNickname: false);
    }
  }

  Future<void> leaveGroup({required final String userId}) async {
    final userInfo = state.toJson();
    try {
      await _leaveGroupUseCase.execute(
          groupId: state.groupId, userId: userId, userInfo: userInfo);
    } catch (e) {
      state = state.copyWith(leaveGroupFailed: true);
    }
  }

  Future<bool> _checkLeader(
      {required String groupId, required String userId}) async {
    try {
      final isLeader =
          await _repository.isLeader(groupId: groupId, userId: userId);
      return isLeader;
    } catch (e) {
      throw Exception('그룹장 확인 실패');
    }
  }
}
