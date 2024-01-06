part of 'stock_bloc.dart';

@freezed
class StockEvent with _$StockEvent {
  const factory StockEvent.getIntradayTimeSeries(String symbol) =
      _GetIntradayTimeSeries;
}
