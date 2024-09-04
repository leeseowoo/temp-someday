import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:someday/common/provider/firebase_instance_provider.dart';
import 'package:someday/my_page/data/data_source/user_data_source.dart';

void main() {
  late FakeFirebaseFirestore fakeDb;
  late ProviderContainer container;

  setUp(() async {
    fakeDb = FakeFirebaseFirestore();
    container = ProviderContainer(overrides: [
      fireStoreProvider.overrideWithValue(fakeDb),
    ]);
    await fakeDb
        .collection('users')
        .doc('id01')
        .set({'nickname': '전성수', 'loginInfo': '카카오로그인'});
  });

  tearDown(() {
    container.dispose();
  });

  group('UserInfoApi method test', () {
    test('유저 정보 호출 getUserInfo 메소드 성공 테스트', () async {
      //given
      final api = container.read(userDataSourceProvider);

      //when
      final result = await api.getUserInfo(userId: 'id01');

      //then
      expect(result.nickname, '전성수');
    });

    test('유저 닉네임 변경 updateUserNickname 메소드 테스트', () async {
      //given
      final api = container.read(userDataSourceProvider);

      //when
      await api.updateUserNickname(userId: 'id01', newNickname: 'Howard');
      final result = await api.getUserInfo(userId: 'id01');

      //then
      expect(result.nickname, 'Howard');
    });
  });
}
