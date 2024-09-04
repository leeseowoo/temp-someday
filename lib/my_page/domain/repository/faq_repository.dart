import 'package:someday/my_page/domain/model/faq_item.dart';

abstract interface class FaqRepository {
  Future<List<FaqItem>> fetchFaqList();
}