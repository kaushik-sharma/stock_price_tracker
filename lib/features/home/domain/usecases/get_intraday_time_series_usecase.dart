import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/stock_entity.dart';
import '../repositories/stock_repository.dart';

class GetIntradayTimeSeriesUseCase
    implements UseCase<List<StockEntity>, String> {
  final StockRepository repository;

  const GetIntradayTimeSeriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<StockEntity>>> call(String params) async {
    return await repository.getIntradayTimeSeries(params);
  }
}
