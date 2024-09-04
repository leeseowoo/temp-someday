import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:someday/common/config/logger.dart';

final loginDataSourceProvider = Provider<LoginDataSource>(
  (ref) => LoginDataSource(
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class LoginDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  LoginDataSource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  Future<bool> loginWithKakao() async {
    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        final OAuthToken oAuthToken = await UserApi.instance.loginWithKakaoTalk();
        loginWithKaKaoCredential(oAuthToken);
        logger.i('카카오톡 로그인 성공');
        return true;
      } catch (error) {
        logger.e('카카오톡 로그인 실패', error: error);

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          logger.i('카카오톡 로그인 취소');
          return false;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          final OAuthToken oAuthToken = await UserApi.instance.loginWithKakaoAccount();
          loginWithKaKaoCredential(oAuthToken);
          logger.i('카카오계정 로그인 성공');
          return true;
        } catch (error) {
          logger.e('카카오계정 로그인 실패', error: error);
          return false;
        }
      }
    } else {
      try {
        final OAuthToken oAuthToken = await UserApi.instance.loginWithKakaoAccount();
        loginWithKaKaoCredential(oAuthToken);
        logger.i('카카오계정 로그인 성공');
        return true;
      } catch (error) {
        logger.e('카카오계정 로그인 실패', error: error);
        return false;
      }
    }
  }

  Future<void> loginWithKaKaoCredential(OAuthToken oAuthToken) async {
    final OAuthProvider oAuthProvider = OAuthProvider('oidc.kakao');

    final AuthCredential credential = oAuthProvider.credential(
      idToken: oAuthToken.idToken,
      accessToken: oAuthToken.accessToken,
    );

    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<bool> loginWithGoogle2() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      return true;
    } catch (error) {
      logger.e('구글 로그인 실패', error: error);
      return false;
    }
  }

  Future<bool> loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);

      logger.i('구글 로그인 성공');
      return true;
    } catch(error) {
      logger.e('구글 로그인 실패', error: error);
      return false;
    }
  }

  Future<bool> loginWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      await _firebaseAuth.signInWithProvider(appleProvider);
      logger.i('애플 로그인 성공');
      return true;
    } catch (error, stackTrace) {
      logger.e('애플 로그인 실패', error: error, stackTrace: stackTrace);
      return false;
    }
  }

  Future<bool> checkUserGroup() async {
    final DocumentReference docRef =
        _firestore.collection('users').doc(_firebaseAuth.currentUser?.uid);

    final DocumentSnapshot docSnapshot = await docRef.get();

    final Map<String, dynamic>? data =
        docSnapshot.data() as Map<String, dynamic>?;

    if (data != null && data.containsKey('groupId')) {
      return true;
    }

    return false;
  }

  Future<void> createUser({
    required final String nickname,
    required final String groupId,
  }) async {
    final DocumentReference docRef =
        _firestore.collection('users').doc(_firebaseAuth.currentUser?.uid);

    await docRef.set({
      'nickname': nickname,
      'providerId': _firebaseAuth.currentUser?.providerData.first.providerId,
      'groupId': groupId,
    });
  }
}
