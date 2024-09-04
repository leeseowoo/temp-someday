import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/config/logger.dart';
import 'package:someday/common/provider/firebase_instance_provider.dart';
import 'package:someday/my_page/domain/model/user_state.dart';

final userDataSourceProvider = Provider<UserDataSource>(
  (ref) {
    final storeInstance = ref.watch(fireStoreProvider);
    final authInstance = ref.watch(fireAuthProvider);
    return UserDataSource(
        storeInstance: storeInstance, authInstance: authInstance);
  },
);

class UserDataSource {
  final FirebaseFirestore _storeInstance;
  final FirebaseAuth _authInstance;

  UserDataSource(
      {required FirebaseFirestore storeInstance,
      required FirebaseAuth authInstance})
      : _storeInstance = storeInstance,
        _authInstance = authInstance;

  Future<UserState> getUserInfo({required String userId}) async {
    try {
      final snapShot =
          await _storeInstance.collection('users').doc(userId).get();

      if (snapShot.exists) {
        return UserState.fromJson(snapShot.data()!);
      } else {
        logger.e('FireStore Docs path', error: '유저 정보 없음');
        throw Exception();
      }
    } on FirebaseException catch (e) {
      logger.e('FireStore getUserInfo Error',
          error: '코드: ${e.code}, 메세지: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected Error getUserInfo', error: '에러 내용: $e');
      rethrow;
    }
  }

  Future<void> updateUserNickname(
      {required String userId, required String newNickname}) async {
    final Map<String, String> data = {'nickname': newNickname};

    try {
      await _storeInstance.collection('users').doc(userId).update(data);
      logger.i('유저 닉네임 변경 성공');
    } on FirebaseException catch (e) {
      logger.e('FireStore UpdateNickname Error',
          error: '코드: ${e.code}, 메세지: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected Error updateUserNickname', error: '에러 내용: $e');
      rethrow;
    }
  }

  Future<void> leaveGroup({required String userId}) async {
    try {
      await _storeInstance.collection('users').doc(userId).delete();
      logger.i('유저 정보 삭제 성공');
    } on FirebaseException catch (e) {
      logger.e('FireStore leaveGroup Error',
          error: '코드: ${e.code}, 메세지: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected Error leaveGroup', error: '에러 내용: $e');
      rethrow;
    }
  }

  Future<void> rollbackLeaveGroup(
      {required Map<String, dynamic> userInfo}) async {
    final DocumentReference docRef =
        _storeInstance.collection('users').doc(_authInstance.currentUser?.uid);

    try {
      await docRef.set({
        'nickname': userInfo['nickname'],
        'groupId': userInfo['groupId'],
        'providerId':
        _authInstance.currentUser?.providerData.first.providerId
      });
      logger.i('유저 데이터 롤백 성공');
    } on FirebaseException catch (e) {
      logger.e('FireStore rollbackLeaveGroup Error',
          error: '코드: ${e.code}, 메세지: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected Error leaveGroup', error: '에러 내용: $e');
      rethrow;
    }
  }
}
