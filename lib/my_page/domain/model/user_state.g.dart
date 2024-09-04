// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStateImpl _$$UserStateImplFromJson(Map<String, dynamic> json) =>
    _$UserStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      nickname: json['nickname'] as String? ?? '',
      providerId: json['providerId'] as String? ?? '',
      groupId: json['groupId'] as String? ?? '',
      isLeader: json['isLeader'] as bool? ?? false,
      isFetchFailed: json['isFetchFailed'] as bool? ?? false,
      isSuccessUpdateNickname: json['isSuccessUpdateNickname'] as bool? ?? true,
      leaveGroupFailed: json['leaveGroupFailed'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserStateImplToJson(_$UserStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'nickname': instance.nickname,
      'providerId': instance.providerId,
      'groupId': instance.groupId,
      'isLeader': instance.isLeader,
      'isFetchFailed': instance.isFetchFailed,
      'isSuccessUpdateNickname': instance.isSuccessUpdateNickname,
      'leaveGroupFailed': instance.leaveGroupFailed,
    };
