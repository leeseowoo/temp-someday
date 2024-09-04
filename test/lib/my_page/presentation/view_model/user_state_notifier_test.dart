import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:someday/common/provider/firebase_instance_provider.dart';
import 'package:someday/my_page/presentation/view_model/user_state_notifier.dart';

void main() {
  late FakeFirebaseFirestore fakeDb;
  late MockFirebaseAuth auth;
  late ProviderContainer container;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() async {
    fakeDb = FakeFirebaseFirestore();
    auth = MockFirebaseAuth();
    container = ProviderContainer(overrides: [
      fireStoreProvider.overrideWithValue(fakeDb),
      fireAuthProvider.overrideWithValue(auth)
    ]);

    await fakeDb
        .collection('users')
        .doc('id01')
        .set({'nickname': '전성수', 'loginInfo': '카카오로그인', 'groupId': 'group01'});

    await fakeDb.collection('group').doc('group01').set({
      'name': '덜덜덜',
      'members': [
        {'id': 'id01', 'nickname': '전성수'}
      ]
    });

    final user = MockUser(
      uid: 'id01',
      providerData: [
        UserInfo.fromJson(
          {
            'uid': 'id01',
            'providerId': 'google.com',
            'isAnonymous': false,
            'isEmailVerified': false
          },
        ),
      ],
    );

    auth.mockUser = user;
  });

  tearDown(() {
    container.dispose();
  });

  group('userStateNotifier test', () {
    test('getUserInfo 메서드에 잘못된 userId를 넣으면 isFetchFail 값이 true가 된다.', () async {
      //given
      const userId = 'wrongId';
      final state = container.read(userStateProvider.notifier);

      //when
      await state.getUserInfo(userId: userId);

      //then
      container.listen(userStateProvider, (prev, next) {
        expect(next.isFetchFailed, true);
      });
    });

    test('updateUserNickname의 Update가 성공하면, state의 nickname 값은 Howard 가 된다',
        () async {
      //given
      final state = container.read(userStateProvider.notifier);
      await state.getUserInfo(userId: 'id01');

      //when
      await state.updateUserNickname(userId: 'id01', newNickname: 'Howard');

      //then
      container.listen(userStateProvider, (prev, next) async {
        expect(prev!.nickname, '전성수');
        expect(next.nickname, 'Howard');
      });
    });

    test(
        'updateUserNickname의 Update가 실패하면, state의 isSuccessUpdateNickname 값은 false가 된다',
        () async {
      //given
      final state = container.read(userStateProvider.notifier);
      //when
      await state.updateUserNickname(userId: 'wrongId', newNickname: 'Howard');
      //then
      container.listen(userStateProvider, (prev, next) async {
        expect(next.isSuccessUpdateNickname, false);
      });
    });
  });

  group('group leave scenario', () {
    test('groupLeave 메서드를 실행하면, users collection의 \'id01\' 이 삭제된다.', () async {
      //given
      final state = container.read(userStateProvider.notifier);
      await state.getUserInfo(userId: 'id01');
      //when
      await state.leaveGroup(userId: 'id01');
      await state.getUserInfo(userId: 'id01');
      //then
      expect(container.read(userStateProvider).isFetchFailed, true);
    });

    test('groupLeave 메서드 실행 중, 유저데이터 삭제 후, 그룹 memebers 삭제 실패시, user데이터가 롤백된다.',
        () async {
      //given
      final state = container.read(userStateProvider.notifier);
      //when
      await state.leaveGroup(userId: 'id01');
      await state.getUserInfo(userId: 'id01');
      //then
      expect(container.read(userStateProvider).isFetchFailed, true);
    });

    //TODO: 그룹 collection 에서 해당 멤버가 삭제되는지 확인필요(그룹정보 보기 추가 이후)
  });
}
