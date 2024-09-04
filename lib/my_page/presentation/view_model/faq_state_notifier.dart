import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/my_page/data/repository/faq_repository_impl.dart';
import 'package:someday/my_page/domain/model/faq_list.dart';
import 'package:someday/my_page/domain/repository/faq_repository.dart';

final faqListProvider =
    StateNotifierProvider<FaqListNotifier, FaqList>((ref) {
  final FaqRepository repository = ref.watch(faqRepositoryProvider);

  return FaqListNotifier(repository: repository);
});

class FaqListNotifier extends StateNotifier<FaqList> {
  final FaqRepository _repository;

  FaqListNotifier({required FaqRepository repository})
      : _repository = repository,
        super(const FaqList());

  void fetchFaqList() async {
    try {
      final listData = await _repository.fetchFaqList();
      state = state.copyWith(isLoading: false, faqList: listData);
    } catch (e) {
      state = state.copyWith(isLoading: false, isListFetchFail: true);
    }
  }

  void togglePanel(int index) {
    state = state.copyWith(
        faqList: state.faqList
            .asMap()
            .map((i, faqItem) {
              if (i == index) {
                return MapEntry(
                    i, faqItem.copyWith(isExpanded: !faqItem.isExpanded));
              }

              return MapEntry(i, faqItem);
            })
            .values
            .toList());
  }
}
