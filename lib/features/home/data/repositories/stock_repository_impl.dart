import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/stock_entity.dart';
import '../../domain/repositories/stock_repository.dart';
import '../datasources/stock_datasource.dart';
import '../models/stock_model.dart';

class StockRepositoryImpl implements StockRepository {
  final StockDataSource dataSource;
  final NetworkInfo networkInfo;

  const StockRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<StockEntity>>> getIntradayTimeSeries(
      String symbol) async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return const Left(InternetFailure());
    }

    try {
      final List<StockModel> response =
          await dataSource.getIntradayTimeSeries(symbol);
      return Right(response);
    } on ServerException catch (_) {
      return const Left(ServerFailure());
    } on CacheException catch (_) {
      return const Left(CacheFailure());
    } on InternetException catch (_) {
      return const Left(InternetFailure());
    } catch (e) {
      return Left(GeneralFailure(e.toString()));
    }
  }
}
