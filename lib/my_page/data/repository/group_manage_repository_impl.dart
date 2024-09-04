import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/my_page/data/data_source/group_manage_data_source.dart';
import 'package:someday/my_page/domain/model/group_info_state.dart';
import 'package:someday/my_page/domain/repository/group_manage_repository.dart';

final groupManageRepositoryProvider = Provider<GroupManageRepository>((ref) {
  final groupManageDataSource = ref.watch(groupManageDataSourceProvider);
  return GroupManageRepositoryImpl(
      groupManageDataSource: groupManageDataSource);
});

class GroupManageRepositoryImpl implements GroupManageRepository {
  final GroupManageDataSource _groupManageDataSource;

  GroupManageRepositoryImpl({
    required GroupManageDataSource groupManageDataSource,
  }) : _groupManageDataSource = groupManageDataSource;

  @override
  Future<GroupInfoState> getGroupInfo({required String groupId}) async {
    return await _groupManageDataSource.getGroupInfo(groupId: groupId);
  }
}
