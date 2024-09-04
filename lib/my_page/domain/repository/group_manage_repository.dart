import 'package:someday/my_page/domain/model/group_info_state.dart';

abstract interface class GroupManageRepository {
  Future<GroupInfoState> getGroupInfo({required final String groupId});
}