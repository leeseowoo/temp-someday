import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/config/logger.dart';
import 'package:someday/common/provider/firebase_instance_provider.dart';
import 'package:someday/my_page/domain/model/group_info_state.dart';

final groupManageDataSourceProvider = Provider<GroupManageDataSource>(
  (ref) {
    final instance = ref.watch(fireStoreProvider);
    return GroupManageDataSource(fireStore: instance);
  },
);

class GroupManageDataSource {
  final FirebaseFirestore _fireStore;

  GroupManageDataSource({
    required FirebaseFirestore fireStore,
  }) : _fireStore = fireStore;

  Future<GroupInfoState> getGroupInfo({required final String groupId}) async {
    try {
      final doc = await _fireStore.collection('group').doc(groupId).get();

      if (!doc.exists || doc.data() == null) {
        logger.e('FireStore getGroupInfo Error', error: '그룹이 존재하지 않음');
        throw Exception();
      }

      return GroupInfoState.fromJson(doc.data()!);

    } on FirebaseException catch(e) {
      logger.e('FireStore getGroupInfo Error',
          error: '코드: ${e.code}, 메세지: ${e.message}');
      rethrow;
    } catch (e){
      logger.e('Unexpected Error getGroupInfo',
          error: '에러 내용 : $e');
      rethrow;
    }
  }

  Future<void> leaveGroup(
      {required final String groupId, required final String userId}) async {
    try {
      final DocumentSnapshot doc =
          await _fireStore.collection('group').doc(groupId).get();
      final List<dynamic> members = doc['members'];
      members.removeWhere((user) => user['id'] == userId);
      await _fireStore.collection('group').doc(groupId).update({
        'members': members,
      });

      logger.i('그룹 멤버 삭제 성공');
    } on FirebaseException catch (e) {
      logger.e('FireStore leaveGroup Error',
          error: '코드: ${e.code}, 메세지: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected Error leaveGroup', error: '에러 내용: $e');
      rethrow;
    }
  }

  Future<bool> checkLeader(
      {required final String groupId, required final String userId}) async {
    try {
      bool isLeader = false;
      final DocumentSnapshot doc =
          await _fireStore.collection('group').doc(groupId).get();
      if (doc.exists && doc['leaderId'] != null) {
        isLeader = doc['leaderId'] == userId;
      } else {
        logger.e('FireStore isLeader Error', error: '그룹이 존재하지 않음');
        throw Exception();
      }
      logger.i('그룹장 여부 확인 성공');
      return isLeader;
    } on FirebaseException catch (e) {
      logger.e('FireStore isLeader Error',
          error: '코드: ${e.code}, 메세지: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected Error isLeader', error: '에러 내용: $e');
      rethrow;
    }
  }
}
