// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FaqList _$FaqListFromJson(Map<String, dynamic> json) {
  return _FaqList.fromJson(json);
}

/// @nodoc
mixin _$FaqList {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isListFetchFail => throw _privateConstructorUsedError;
  List<FaqItem> get faqList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FaqListCopyWith<FaqList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqListCopyWith<$Res> {
  factory $FaqListCopyWith(FaqList value, $Res Function(FaqList) then) =
      _$FaqListCopyWithImpl<$Res, FaqList>;
  @useResult
  $Res call({bool isLoading, bool isListFetchFail, List<FaqItem> faqList});
}

/// @nodoc
class _$FaqListCopyWithImpl<$Res, $Val extends FaqList>
    implements $FaqListCopyWith<$Res> {
  _$FaqListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isListFetchFail = null,
    Object? faqList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isListFetchFail: null == isListFetchFail
          ? _value.isListFetchFail
          : isListFetchFail // ignore: cast_nullable_to_non_nullable
              as bool,
      faqList: null == faqList
          ? _value.faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FaqItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqListImplCopyWith<$Res> implements $FaqListCopyWith<$Res> {
  factory _$$FaqListImplCopyWith(
          _$FaqListImpl value, $Res Function(_$FaqListImpl) then) =
      __$$FaqListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isListFetchFail, List<FaqItem> faqList});
}

/// @nodoc
class __$$FaqListImplCopyWithImpl<$Res>
    extends _$FaqListCopyWithImpl<$Res, _$FaqListImpl>
    implements _$$FaqListImplCopyWith<$Res> {
  __$$FaqListImplCopyWithImpl(
      _$FaqListImpl _value, $Res Function(_$FaqListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isListFetchFail = null,
    Object? faqList = null,
  }) {
    return _then(_$FaqListImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isListFetchFail: null == isListFetchFail
          ? _value.isListFetchFail
          : isListFetchFail // ignore: cast_nullable_to_non_nullable
              as bool,
      faqList: null == faqList
          ? _value._faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FaqItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqListImpl implements _FaqList {
  const _$FaqListImpl(
      {this.isLoading = true,
      this.isListFetchFail = false,
      final List<FaqItem> faqList = const []})
      : _faqList = faqList;

  factory _$FaqListImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqListImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isListFetchFail;
  final List<FaqItem> _faqList;
  @override
  @JsonKey()
  List<FaqItem> get faqList {
    if (_faqList is EqualUnmodifiableListView) return _faqList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqList);
  }

  @override
  String toString() {
    return 'FaqList(isLoading: $isLoading, isListFetchFail: $isListFetchFail, faqList: $faqList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqListImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isListFetchFail, isListFetchFail) ||
                other.isListFetchFail == isListFetchFail) &&
            const DeepCollectionEquality().equals(other._faqList, _faqList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isListFetchFail,
      const DeepCollectionEquality().hash(_faqList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqListImplCopyWith<_$FaqListImpl> get copyWith =>
      __$$FaqListImplCopyWithImpl<_$FaqListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqListImplToJson(
      this,
    );
  }
}

abstract class _FaqList implements FaqList {
  const factory _FaqList(
      {final bool isLoading,
      final bool isListFetchFail,
      final List<FaqItem> faqList}) = _$FaqListImpl;

  factory _FaqList.fromJson(Map<String, dynamic> json) = _$FaqListImpl.fromJson;

  @override
  bool get isLoading;
  @override
  bool get isListFetchFail;
  @override
  List<FaqItem> get faqList;
  @override
  @JsonKey(ignore: true)
  _$$FaqListImplCopyWith<_$FaqListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
