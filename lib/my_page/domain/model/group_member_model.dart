import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_member_model.freezed.dart';

part 'group_member_model.g.dart';
//TODO: 추후 각 유저의 프로필사진이 등록되면 필드값 추가
@freezed
class GroupMemberModel with _$GroupMemberModel {
  const factory GroupMemberModel({
    required String nickname
  }) = _GroupMemberModel;

  factory GroupMemberModel.fromJson(Map<String, Object?> json) => _$GroupMemberModelFromJson(json);
}