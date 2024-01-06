import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/stock_entity.dart';
import '../../domain/usecases/get_intraday_time_series_usecase.dart';

part 'stock_bloc.freezed.dart';
part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final GetIntradayTimeSeriesUseCase useCase;

  StockBloc(this.useCase) : super(const _Initial()) {
    on<_GetIntradayTimeSeries>(_onGetIntradayTimeSeries);
  }

  Future<void> _onGetIntradayTimeSeries(
      _GetIntradayTimeSeries event, Emitter<StockState> emit) async {
    emit(const _Loading());

    final failureOrSuccess = await useCase(event.symbol);
    failureOrSuccess.fold<void>(
      (left) => emit(_Failure(left.message)),
      (right) => emit(_Success(right)),
    );
  }
}
