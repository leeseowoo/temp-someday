// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqListImpl _$$FaqListImplFromJson(Map<String, dynamic> json) =>
    _$FaqListImpl(
      isLoading: json['isLoading'] as bool? ?? true,
      isListFetchFail: json['isListFetchFail'] as bool? ?? false,
      faqList: (json['faqList'] as List<dynamic>?)
              ?.map((e) => FaqItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FaqListImplToJson(_$FaqListImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isListFetchFail': instance.isListFetchFail,
      'faqList': instance.faqList,
    };
