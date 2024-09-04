import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_item.freezed.dart';

part 'faq_item.g.dart';

@freezed
class FaqItem with _$FaqItem {
  const factory FaqItem({
    required String title,
    required String content,
    @Default(false) bool isExpanded,
  }) = _FaqItem;

  factory FaqItem.fromJson(Map<String, Object?> json) => _$FaqItemFromJson(json);
}