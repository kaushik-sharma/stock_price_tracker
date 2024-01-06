// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StockModel _$StockModelFromJson(Map<String, dynamic> json) {
  return _StockModel.fromJson(json);
}

/// @nodoc
mixin _$StockModel {
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: '1. open', fromJson: _stringToDouble)
  double get open => throw _privateConstructorUsedError;
  @JsonKey(name: '2. high', fromJson: _stringToDouble)
  double get high => throw _privateConstructorUsedError;
  @JsonKey(name: '3. low', fromJson: _stringToDouble)
  double get low => throw _privateConstructorUsedError;
  @JsonKey(name: '4. close', fromJson: _stringToDouble)
  double get close => throw _privateConstructorUsedError;
  @JsonKey(name: '5. volume', fromJson: _stringToInt)
  int get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockModelCopyWith<StockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockModelCopyWith<$Res> {
  factory $StockModelCopyWith(
          StockModel value, $Res Function(StockModel) then) =
      _$StockModelCopyWithImpl<$Res, StockModel>;
  @useResult
  $Res call(
      {String time,
      @JsonKey(name: '1. open', fromJson: _stringToDouble) double open,
      @JsonKey(name: '2. high', fromJson: _stringToDouble) double high,
      @JsonKey(name: '3. low', fromJson: _stringToDouble) double low,
      @JsonKey(name: '4. close', fromJson: _stringToDouble) double close,
      @JsonKey(name: '5. volume', fromJson: _stringToInt) int volume});
}

/// @nodoc
class _$StockModelCopyWithImpl<$Res, $Val extends StockModel>
    implements $StockModelCopyWith<$Res> {
  _$StockModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockModelImplCopyWith<$Res>
    implements $StockModelCopyWith<$Res> {
  factory _$$StockModelImplCopyWith(
          _$StockModelImpl value, $Res Function(_$StockModelImpl) then) =
      __$$StockModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String time,
      @JsonKey(name: '1. open', fromJson: _stringToDouble) double open,
      @JsonKey(name: '2. high', fromJson: _stringToDouble) double high,
      @JsonKey(name: '3. low', fromJson: _stringToDouble) double low,
      @JsonKey(name: '4. close', fromJson: _stringToDouble) double close,
      @JsonKey(name: '5. volume', fromJson: _stringToInt) int volume});
}

/// @nodoc
class __$$StockModelImplCopyWithImpl<$Res>
    extends _$StockModelCopyWithImpl<$Res, _$StockModelImpl>
    implements _$$StockModelImplCopyWith<$Res> {
  __$$StockModelImplCopyWithImpl(
      _$StockModelImpl _value, $Res Function(_$StockModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_$StockModelImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockModelImpl implements _StockModel {
  const _$StockModelImpl(
      {required this.time,
      @JsonKey(name: '1. open', fromJson: _stringToDouble) required this.open,
      @JsonKey(name: '2. high', fromJson: _stringToDouble) required this.high,
      @JsonKey(name: '3. low', fromJson: _stringToDouble) required this.low,
      @JsonKey(name: '4. close', fromJson: _stringToDouble) required this.close,
      @JsonKey(name: '5. volume', fromJson: _stringToInt)
      required this.volume});

  factory _$StockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockModelImplFromJson(json);

  @override
  final String time;
  @override
  @JsonKey(name: '1. open', fromJson: _stringToDouble)
  final double open;
  @override
  @JsonKey(name: '2. high', fromJson: _stringToDouble)
  final double high;
  @override
  @JsonKey(name: '3. low', fromJson: _stringToDouble)
  final double low;
  @override
  @JsonKey(name: '4. close', fromJson: _stringToDouble)
  final double close;
  @override
  @JsonKey(name: '5. volume', fromJson: _stringToInt)
  final int volume;

  @override
  String toString() {
    return 'StockModel(time: $time, open: $open, high: $high, low: $low, close: $close, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockModelImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, open, high, low, close, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockModelImplCopyWith<_$StockModelImpl> get copyWith =>
      __$$StockModelImplCopyWithImpl<_$StockModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockModelImplToJson(
      this,
    );
  }
}

abstract class _StockModel implements StockModel {
  const factory _StockModel(
      {required final String time,
      @JsonKey(name: '1. open', fromJson: _stringToDouble)
      required final double open,
      @JsonKey(name: '2. high', fromJson: _stringToDouble)
      required final double high,
      @JsonKey(name: '3. low', fromJson: _stringToDouble)
      required final double low,
      @JsonKey(name: '4. close', fromJson: _stringToDouble)
      required final double close,
      @JsonKey(name: '5. volume', fromJson: _stringToInt)
      required final int volume}) = _$StockModelImpl;

  factory _StockModel.fromJson(Map<String, dynamic> json) =
      _$StockModelImpl.fromJson;

  @override
  String get time;
  @override
  @JsonKey(name: '1. open', fromJson: _stringToDouble)
  double get open;
  @override
  @JsonKey(name: '2. high', fromJson: _stringToDouble)
  double get high;
  @override
  @JsonKey(name: '3. low', fromJson: _stringToDouble)
  double get low;
  @override
  @JsonKey(name: '4. close', fromJson: _stringToDouble)
  double get close;
  @override
  @JsonKey(name: '5. volume', fromJson: _stringToInt)
  int get volume;
  @override
  @JsonKey(ignore: true)
  _$$StockModelImplCopyWith<_$StockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
