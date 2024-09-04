import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:someday/login/data/data_source/login_data_source.dart';

import 'login_data_source_test.mocks.dart';

// 모킹된 GoogleSignIn 객체 생성
class MockGoogleSignIn extends Mock implements GoogleSignIn {}

@GenerateMocks([FirebaseAuth, FirebaseFirestore, UserCredential, GoogleSignInAccount, GoogleSignInAuthentication])
// @GenerateMocks([FirebaseAuth, FirebaseFirestore, GoogleSignIn, GoogleSignInAccount])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late final MockFirebaseAuth mockFirebaseAuth;
  late final MockFirebaseFirestore mockFirestore;
  late final MockUserCredential mockUserCredential;
  late final MockGoogleSignIn mockGoogleSignIn;
  late final MockGoogleSignInAccount mockGoogleSignInAccount;
  late final MockGoogleSignInAuthentication mockGoogleSignInAuthentication;
  late final LoginDataSource loginDataSource;

  setUp(() {
    // given
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirestore = MockFirebaseFirestore();
    mockUserCredential = MockUserCredential();
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();

    loginDataSource = LoginDataSource(
      firebaseAuth: mockFirebaseAuth,
      firestore: mockFirestore,
    );
  });

  group('구글 로그인', () {
    test('구글 로그인 성공', () async {
      print(mockGoogleSignInAccount);
      when(mockGoogleSignIn.signIn).thenAnswer((_) async => mockGoogleSignInAccount);
      // when(mockGoogleSignIn.signIn()).thenAnswer((_) async => mockGoogleSignInAccount);


      // expect(await loginDataSource.loginWithGoogle2(), completion(true));

    // verify(mockGoogleSignIn.signIn()).called(1); // signIn이 한 번 호출되었는지 확인

    });

    // test('구글 로그인 성공', () {
    //   when(mockGoogleSignIn.signIn()).thenAnswer((_) async => mockGoogleSignInAccount);
    //
    //   verify(mockGoogleSignIn.signIn()).called(1); // signIn이 한 번 호출되었는지 확인
    //
    //
    //   when(mockGoogleSignInAccount.authentication).thenAnswer((_) async => mockGoogleSignInAuthentication);
    //   when(mockGoogleSignInAuthentication.accessToken).thenReturn('accessToken');
    //   when(mockGoogleSignInAuthentication.idToken).thenReturn('idToken');
    //   when(mockFirebaseAuth.signInWithCredential(any)).thenAnswer((_) async => MockUserCredential());
    //
    //   // expect(await loginDataSource.loginWithGoogle(), true);
    //
    //   expect(loginDataSource.loginWithGoogle(), completion(true));
    // });
  });

  group('애플 로그인', () {
    test('애플 로그인 성공', () {
      // when
      when(mockFirebaseAuth.signInWithProvider(any))
          .thenAnswer((_) async => mockUserCredential);

      // then
      expect(loginDataSource.loginWithApple(), completion(true));

      verify(mockFirebaseAuth.signInWithProvider(any));
    });

    test('애플 로그인 실패', () {
      // when
      when(mockFirebaseAuth.signInWithProvider(any)).thenThrow(Exception());

      // then
      expect(loginDataSource.loginWithApple(), completion(false));

      verify(mockFirebaseAuth.signInWithProvider(any));
    });
  });
}
