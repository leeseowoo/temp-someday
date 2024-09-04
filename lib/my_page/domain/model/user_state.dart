import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

part 'user_state.g.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isLoading,
    @Default('') String nickname,
    @Default('') String providerId,
    @Default('') String groupId,
    @Default(false) bool isLeader,
    @Default(false) bool isFetchFailed,
    @Default(true) bool isSuccessUpdateNickname,
    @Default(false) bool leaveGroupFailed,
  }) = _UserState;

  factory UserState.fromJson(Map<String, Object?> json) => _$UserStateFromJson(json);
}