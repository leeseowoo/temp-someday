// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqItemImpl _$$FaqItemImplFromJson(Map<String, dynamic> json) =>
    _$FaqItemImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$$FaqItemImplToJson(_$FaqItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'isExpanded': instance.isExpanded,
    };
