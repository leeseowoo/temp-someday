import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/my_page/data/data_source/group_manage_data_source.dart';
import 'package:someday/my_page/data/data_source/user_data_source.dart';
import 'package:someday/my_page/domain/model/user_state.dart';
import 'package:someday/my_page/domain/repository/user_info_repository.dart';

final userInfoRepositoryProvider = Provider<UserInfoRepository>(

  (ref) {
    final userDataSource = ref.watch(userDataSourceProvider);
    final groupManageDataSource = ref.watch(groupManageDataSourceProvider);
    return UserInfoRepositoryImpl(
      userDataSource: userDataSource,
      groupManageDataSource: groupManageDataSource);
  },
);

class UserInfoRepositoryImpl implements UserInfoRepository {
  final UserDataSource _userDataSource;
  final GroupManageDataSource _groupManageDataSource;

  UserInfoRepositoryImpl(
      {required UserDataSource userDataSource,
      required GroupManageDataSource groupManageDataSource})
      : _userDataSource = userDataSource,
        _groupManageDataSource = groupManageDataSource;

  @override
  Future<UserState> getUserInfo({required String userId}) async {
    return await _userDataSource.getUserInfo(userId: userId);
  }

  @override
  Future<void> updateUserNickname(
      {required String userId, required String newNickname}) async {
    return await _userDataSource.updateUserNickname(
        userId: userId, newNickname: newNickname);
  }

  @override
  Future<void> leaveGroup(
      {required String groupId,
      required String userId,
      required Map<String, dynamic> userInfo}) async {
    bool userLeaveGroup = false;

    try {
      await _userDataSource.leaveGroup(userId: userId);
      userLeaveGroup = true;
      await _groupManageDataSource.leaveGroup(groupId: groupId, userId: userId);
    } catch (e) {
      if (userLeaveGroup) {
        _userDataSource.rollbackLeaveGroup(userInfo: userInfo);
      }
    }
  }

  @override
  Future<bool> isLeader({required String groupId, required String userId}) async {
    
    return await _groupManageDataSource.checkLeader(groupId: groupId, userId: userId);
  }
}
