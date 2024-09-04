// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_info_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupInfoStateImpl _$$GroupInfoStateImplFromJson(Map<String, dynamic> json) =>
    _$GroupInfoStateImpl(
      isLoading: json['isLoading'] as bool? ?? true,
      isFetchFailed: json['isFetchFailed'] as bool? ?? false,
      name: json['name'] as String,
      leaderNickname: json['leaderNickname'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => GroupMemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GroupInfoStateImplToJson(
        _$GroupInfoStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isFetchFailed': instance.isFetchFailed,
      'name': instance.name,
      'leaderNickname': instance.leaderNickname,
      'members': instance.members,
    };
