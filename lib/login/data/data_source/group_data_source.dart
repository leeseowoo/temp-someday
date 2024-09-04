import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/config/logger.dart';

final groupDataSourceProvider = Provider<GroupDataSource>(
  (ref) => GroupDataSource(
    firestore: FirebaseFirestore.instance,
    firebaseAuth: FirebaseAuth.instance,
  ),
);

class GroupDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  GroupDataSource({
    required FirebaseFirestore firestore,
    required FirebaseAuth firebaseAuth,
  })  : _firestore = firestore,
        _firebaseAuth = firebaseAuth;

  Future<String> createGroup({
    required final String groupName,
    required final String nickname,
  }) async {
    final DocumentReference docRef = _firestore.collection('groups').doc();

    await docRef.set({
      'name': groupName,
      'leaderId': _firebaseAuth.currentUser?.uid,
      'leaderNickname': nickname,
      'createdAt': Timestamp.fromDate(DateTime.now()),
    });

    return docRef.id;
  }

  Future<bool> joinGroup({
    required final String groupCode,
    required final String nickname,
  }) async {
    try {
      final DocumentReference groupDocRef =
          _firestore.collection('groups').doc(groupCode);
      final DocumentReference userDocRef =
          _firestore.collection('users').doc(_firebaseAuth.currentUser?.uid);

      Map<String, dynamic> newMember = {
        'id': _firebaseAuth.currentUser?.uid,
        'nickname': nickname,
      };

      await groupDocRef.update({
        'members': FieldValue.arrayUnion([newMember])
      });

      await userDocRef.set({
        'nickname': nickname,
        'providerId': _firebaseAuth.currentUser?.providerData.first.providerId,
        'groupId': groupCode,
      });

      logger.i('그룹 참여 성공');
      return true;
    } catch (error) {
      logger.e('그룹 참여 실패', error: error);
      return false;
    }
  }
}
