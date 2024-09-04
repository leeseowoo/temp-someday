import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:someday/my_page/data/data_source/faq_data_source.dart';

void main() {
  late FakeFirebaseFirestore fakeDb;
  late ProviderContainer container;

  setUp(() async {
    fakeDb = FakeFirebaseFirestore();
    container = ProviderContainer(overrides: [
      faqDataSourceProvider
          .overrideWithValue(FaqDataSource(storeInstance: fakeDb))
    ]);
    await fakeDb
        .collection('faq')
        .doc('id01')
        .set({'title': '제목1', 'content': '내용1'});
  });

  group('faq fetchFaqList method test', () {
    test('faqApi 호출 fetchFaqList 메소드 성공 테스트', () async {
      //given
      final FaqDataSource api = container.read(faqDataSourceProvider);
      addTearDown(container.dispose);

      //when
      final result = await api.fetchFaqList();

      //then
      expect(result, isNotEmpty);
    });
  });
}
