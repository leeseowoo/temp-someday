import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/config/logger.dart';
import 'package:someday/my_page/domain/model/faq_item.dart';

final faqDataSourceProvider = Provider<FaqDataSource>(
  (ref) => FaqDataSource(storeInstance: FirebaseFirestore.instance),
);

class FaqDataSource {
  final FirebaseFirestore _storeInstance;

  FaqDataSource({
    required FirebaseFirestore storeInstance,
  }) : _storeInstance = storeInstance;

  Future<List<FaqItem>> fetchFaqList() async {
    try {
      final collection = await _storeInstance.collection('faq').get();
      if (collection.docs.isEmpty) {
        logger.e('FireStore fetchFaq Error',
            error: 'FAQ 데이터가 존재하지 않음. docs empty');
        throw Exception();
      }

      return collection.docs.map((e) => FaqItem.fromJson(e.data())).toList();
    } on FirebaseException catch (e) {
      logger.e('FireStore fetchFaq Error',
          error: '코드: ${e.code}, 메세지: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected Error fetchFaq', error: '에러 내용: $e');
      rethrow;
    }
  }
}
