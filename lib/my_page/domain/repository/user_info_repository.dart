import 'package:someday/my_page/domain/model/user_state.dart';

abstract interface class UserInfoRepository {
  Future<UserState> getUserInfo({required String userId});

  Future<void> updateUserNickname(
      {required String userId, required String newNickname});

  Future<void> leaveGroup(
      {required String groupId, required String userId, required Map<String, dynamic> userInfo});

  Future<bool> isLeader({required String groupId, required String userId});
}