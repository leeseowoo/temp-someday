import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/config/logger.dart';
import 'package:someday/login/data/data_source/group_data_source.dart';
import 'package:someday/login/data/data_source/login_data_source.dart';
import 'package:someday/login/domain/repository/group_repository.dart';

final groupRepositoryProvider = Provider<GroupRepository>((ref) {
  return GroupRepositoryImpl(
    groupDataSource: ref.watch(groupDataSourceProvider),
    loginDataSource: ref.watch(loginDataSourceProvider),
  );
});

class GroupRepositoryImpl implements GroupRepository {
  final GroupDataSource _groupDataSource;
  final LoginDataSource _loginDataSource;

  GroupRepositoryImpl({
    required GroupDataSource groupDataSource,
    required LoginDataSource loginDataSource,
  })  : _groupDataSource = groupDataSource,
        _loginDataSource = loginDataSource;

  @override
  Future<bool> createGroup({
    required final String groupName,
    required final String nickname,
  }) async {
    try {
      final String groupId = await _groupDataSource.createGroup(
        groupName: groupName,
        nickname: nickname,
      );
      await _loginDataSource.createUser(
        nickname: nickname,
        groupId: groupId,
      );
      logger.i('그룹 생성 성공');
      return true;
    } catch (error) {
      logger.e('그룹 생성 실패', error: error);
      return false;
    }
  }

  @override
  Future<bool> joinGroup({
    required final String groupCode,
    required final String nickname,
  }) async {
    return await _groupDataSource.joinGroup(
      groupCode: groupCode,
      nickname: nickname,
    );
  }
}
