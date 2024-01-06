import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/stock_entity.dart';

part 'stock_model.freezed.dart';
part 'stock_model.g.dart';

double _stringToDouble(String value) => double.parse(value);

int _stringToInt(String value) => int.parse(value);

@freezed
class StockModel extends StockEntity with _$StockModel {
  const factory StockModel({
    required String time,
    @JsonKey(name: '1. open', fromJson: _stringToDouble) required double open,
    @JsonKey(name: '2. high', fromJson: _stringToDouble) required double high,
    @JsonKey(name: '3. low', fromJson: _stringToDouble) required double low,
    @JsonKey(name: '4. close', fromJson: _stringToDouble) required double close,
    @JsonKey(name: '5. volume', fromJson: _stringToInt) required int volume,
  }) = _StockModel;

  factory StockModel.fromJson(Map<String, dynamic> json) =>
      _$StockModelFromJson(json);
}
