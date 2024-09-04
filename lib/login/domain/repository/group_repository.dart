abstract interface class GroupRepository {
  Future<bool> createGroup({required final String groupName, required final String nickname});
  Future<bool> joinGroup({required final String groupCode, required final String nickname});
}