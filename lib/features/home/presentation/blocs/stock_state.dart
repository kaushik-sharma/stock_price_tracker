part of 'stock_bloc.dart';

@freezed
class StockState with _$StockState {
  const factory StockState.initial() = _Initial;

  const factory StockState.loading() = _Loading;

  const factory StockState.failure(String message) = _Failure;

  const factory StockState.success(List<StockEntity> entities) = _Success;
}
