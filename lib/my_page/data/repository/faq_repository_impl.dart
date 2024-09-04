import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/my_page/data/data_source/faq_data_source.dart';
import 'package:someday/my_page/domain/model/faq_item.dart';
import 'package:someday/my_page/domain/repository/faq_repository.dart';

final faqRepositoryProvider = Provider<FaqRepository>(
  (ref) => FaqRepositoryImpl(
    dataSource: ref.watch(faqDataSourceProvider),
  ),
);

class FaqRepositoryImpl implements FaqRepository {
  final FaqDataSource _dataSource;

  FaqRepositoryImpl({
    required FaqDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<FaqItem>> fetchFaqList() async {
    return await _dataSource.fetchFaqList();
  }

}
