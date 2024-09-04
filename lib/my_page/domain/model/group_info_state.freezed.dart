// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupInfoState _$GroupInfoStateFromJson(Map<String, dynamic> json) {
  return _GroupInfoState.fromJson(json);
}

/// @nodoc
mixin _$GroupInfoState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFetchFailed => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get leaderNickname => throw _privateConstructorUsedError;
  List<GroupMemberModel> get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupInfoStateCopyWith<GroupInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupInfoStateCopyWith<$Res> {
  factory $GroupInfoStateCopyWith(
          GroupInfoState value, $Res Function(GroupInfoState) then) =
      _$GroupInfoStateCopyWithImpl<$Res, GroupInfoState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isFetchFailed,
      String name,
      String leaderNickname,
      List<GroupMemberModel> members});
}

/// @nodoc
class _$GroupInfoStateCopyWithImpl<$Res, $Val extends GroupInfoState>
    implements $GroupInfoStateCopyWith<$Res> {
  _$GroupInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFetchFailed = null,
    Object? name = null,
    Object? leaderNickname = null,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchFailed: null == isFetchFailed
          ? _value.isFetchFailed
          : isFetchFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      leaderNickname: null == leaderNickname
          ? _value.leaderNickname
          : leaderNickname // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<GroupMemberModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupInfoStateImplCopyWith<$Res>
    implements $GroupInfoStateCopyWith<$Res> {
  factory _$$GroupInfoStateImplCopyWith(_$GroupInfoStateImpl value,
          $Res Function(_$GroupInfoStateImpl) then) =
      __$$GroupInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isFetchFailed,
      String name,
      String leaderNickname,
      List<GroupMemberModel> members});
}

/// @nodoc
class __$$GroupInfoStateImplCopyWithImpl<$Res>
    extends _$GroupInfoStateCopyWithImpl<$Res, _$GroupInfoStateImpl>
    implements _$$GroupInfoStateImplCopyWith<$Res> {
  __$$GroupInfoStateImplCopyWithImpl(
      _$GroupInfoStateImpl _value, $Res Function(_$GroupInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFetchFailed = null,
    Object? name = null,
    Object? leaderNickname = null,
    Object? members = null,
  }) {
    return _then(_$GroupInfoStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchFailed: null == isFetchFailed
          ? _value.isFetchFailed
          : isFetchFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      leaderNickname: null == leaderNickname
          ? _value.leaderNickname
          : leaderNickname // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<GroupMemberModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupInfoStateImpl implements _GroupInfoState {
  const _$GroupInfoStateImpl(
      {this.isLoading = true,
      this.isFetchFailed = false,
      required this.name,
      required this.leaderNickname,
      required final List<GroupMemberModel> members})
      : _members = members;

  factory _$GroupInfoStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupInfoStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isFetchFailed;
  @override
  final String name;
  @override
  final String leaderNickname;
  final List<GroupMemberModel> _members;
  @override
  List<GroupMemberModel> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'GroupInfoState(isLoading: $isLoading, isFetchFailed: $isFetchFailed, name: $name, leaderNickname: $leaderNickname, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupInfoStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFetchFailed, isFetchFailed) ||
                other.isFetchFailed == isFetchFailed) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.leaderNickname, leaderNickname) ||
                other.leaderNickname == leaderNickname) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isFetchFailed, name,
      leaderNickname, const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupInfoStateImplCopyWith<_$GroupInfoStateImpl> get copyWith =>
      __$$GroupInfoStateImplCopyWithImpl<_$GroupInfoStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupInfoStateImplToJson(
      this,
    );
  }
}

abstract class _GroupInfoState implements GroupInfoState {
  const factory _GroupInfoState(
      {final bool isLoading,
      final bool isFetchFailed,
      required final String name,
      required final String leaderNickname,
      required final List<GroupMemberModel> members}) = _$GroupInfoStateImpl;

  factory _GroupInfoState.fromJson(Map<String, dynamic> json) =
      _$GroupInfoStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get isFetchFailed;
  @override
  String get name;
  @override
  String get leaderNickname;
  @override
  List<GroupMemberModel> get members;
  @override
  @JsonKey(ignore: true)
  _$$GroupInfoStateImplCopyWith<_$GroupInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
