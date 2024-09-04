import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:someday/my_page/domain/model/faq_item.dart';

part 'faq_list.freezed.dart';

part 'faq_list.g.dart';

@freezed
class FaqList with _$FaqList {
  const factory FaqList({
    @Default(true) bool isLoading,
    @Default(false) bool isListFetchFail,
    @Default([]) List<FaqItem> faqList,
  }) = _FaqList;
  
  factory FaqList.fromJson(Map<String, Object?> json) => _$FaqListFromJson(json); 
}