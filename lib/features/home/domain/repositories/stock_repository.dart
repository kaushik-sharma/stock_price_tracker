import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/stock_entity.dart';

abstract class StockRepository {
  Future<Either<Failure, List<StockEntity>>> getIntradayTimeSeries(
      String symbol);
}
