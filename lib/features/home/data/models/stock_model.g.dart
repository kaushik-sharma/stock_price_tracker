// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockModelImpl _$$StockModelImplFromJson(Map<String, dynamic> json) =>
    _$StockModelImpl(
      time: json['time'] as String,
      open: _stringToDouble(json['1. open'] as String),
      high: _stringToDouble(json['2. high'] as String),
      low: _stringToDouble(json['3. low'] as String),
      close: _stringToDouble(json['4. close'] as String),
      volume: _stringToInt(json['5. volume'] as String),
    );

Map<String, dynamic> _$$StockModelImplToJson(_$StockModelImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      '1. open': instance.open,
      '2. high': instance.high,
      '3. low': instance.low,
      '4. close': instance.close,
      '5. volume': instance.volume,
    };
