// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return _UserState.fromJson(json);
}

/// @nodoc
mixin _$UserState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get providerId => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  bool get isLeader => throw _privateConstructorUsedError;
  bool get isFetchFailed => throw _privateConstructorUsedError;
  bool get isSuccessUpdateNickname => throw _privateConstructorUsedError;
  bool get leaveGroupFailed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {bool isLoading,
      String nickname,
      String providerId,
      String groupId,
      bool isLeader,
      bool isFetchFailed,
      bool isSuccessUpdateNickname,
      bool leaveGroupFailed});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? nickname = null,
    Object? providerId = null,
    Object? groupId = null,
    Object? isLeader = null,
    Object? isFetchFailed = null,
    Object? isSuccessUpdateNickname = null,
    Object? leaveGroupFailed = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchFailed: null == isFetchFailed
          ? _value.isFetchFailed
          : isFetchFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessUpdateNickname: null == isSuccessUpdateNickname
          ? _value.isSuccessUpdateNickname
          : isSuccessUpdateNickname // ignore: cast_nullable_to_non_nullable
              as bool,
      leaveGroupFailed: null == leaveGroupFailed
          ? _value.leaveGroupFailed
          : leaveGroupFailed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String nickname,
      String providerId,
      String groupId,
      bool isLeader,
      bool isFetchFailed,
      bool isSuccessUpdateNickname,
      bool leaveGroupFailed});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? nickname = null,
    Object? providerId = null,
    Object? groupId = null,
    Object? isLeader = null,
    Object? isFetchFailed = null,
    Object? isSuccessUpdateNickname = null,
    Object? leaveGroupFailed = null,
  }) {
    return _then(_$UserStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchFailed: null == isFetchFailed
          ? _value.isFetchFailed
          : isFetchFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessUpdateNickname: null == isSuccessUpdateNickname
          ? _value.isSuccessUpdateNickname
          : isSuccessUpdateNickname // ignore: cast_nullable_to_non_nullable
              as bool,
      leaveGroupFailed: null == leaveGroupFailed
          ? _value.leaveGroupFailed
          : leaveGroupFailed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {this.isLoading = false,
      this.nickname = '',
      this.providerId = '',
      this.groupId = '',
      this.isLeader = false,
      this.isFetchFailed = false,
      this.isSuccessUpdateNickname = true,
      this.leaveGroupFailed = false});

  factory _$UserStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String nickname;
  @override
  @JsonKey()
  final String providerId;
  @override
  @JsonKey()
  final String groupId;
  @override
  @JsonKey()
  final bool isLeader;
  @override
  @JsonKey()
  final bool isFetchFailed;
  @override
  @JsonKey()
  final bool isSuccessUpdateNickname;
  @override
  @JsonKey()
  final bool leaveGroupFailed;

  @override
  String toString() {
    return 'UserState(isLoading: $isLoading, nickname: $nickname, providerId: $providerId, groupId: $groupId, isLeader: $isLeader, isFetchFailed: $isFetchFailed, isSuccessUpdateNickname: $isSuccessUpdateNickname, leaveGroupFailed: $leaveGroupFailed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.isLeader, isLeader) ||
                other.isLeader == isLeader) &&
            (identical(other.isFetchFailed, isFetchFailed) ||
                other.isFetchFailed == isFetchFailed) &&
            (identical(
                    other.isSuccessUpdateNickname, isSuccessUpdateNickname) ||
                other.isSuccessUpdateNickname == isSuccessUpdateNickname) &&
            (identical(other.leaveGroupFailed, leaveGroupFailed) ||
                other.leaveGroupFailed == leaveGroupFailed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      nickname,
      providerId,
      groupId,
      isLeader,
      isFetchFailed,
      isSuccessUpdateNickname,
      leaveGroupFailed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStateImplToJson(
      this,
    );
  }
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {final bool isLoading,
      final String nickname,
      final String providerId,
      final String groupId,
      final bool isLeader,
      final bool isFetchFailed,
      final bool isSuccessUpdateNickname,
      final bool leaveGroupFailed}) = _$UserStateImpl;

  factory _UserState.fromJson(Map<String, dynamic> json) =
      _$UserStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  String get nickname;
  @override
  String get providerId;
  @override
  String get groupId;
  @override
  bool get isLeader;
  @override
  bool get isFetchFailed;
  @override
  bool get isSuccessUpdateNickname;
  @override
  bool get leaveGroupFailed;
  @override
  @JsonKey(ignore: true)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
