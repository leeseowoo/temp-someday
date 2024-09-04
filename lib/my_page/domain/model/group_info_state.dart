import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:someday/my_page/domain/model/group_member_model.dart';

part 'group_info_state.freezed.dart';

part 'group_info_state.g.dart';

@freezed
class GroupInfoState with _$GroupInfoState {
  const factory GroupInfoState({
    @Default(true) bool isLoading,
    @Default(false) bool isFetchFailed,
    required String name,
    required String leaderNickname,
    required List<GroupMemberModel> members
  }) = _GroupInfoState;

  factory GroupInfoState.fromJson(Map<String, Object?> json) => _$GroupInfoStateFromJson(json);
}