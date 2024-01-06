import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'core/helpers/custom_dio_impl.dart';
import 'core/network/network_info.dart';
import 'features/home/data/datasources/stock_datasource.dart';
import 'features/home/data/repositories/stock_repository_impl.dart';
import 'features/home/domain/repositories/stock_repository.dart';
import 'features/home/domain/usecases/get_intraday_time_series_usecase.dart';
import 'features/home/presentation/blocs/stock_bloc.dart';

final GetIt sl = GetIt.instance;

void init() {
  _injectExternal();
  _injectCore();
  _injectHome();
}

void _injectHome() {
  /// Data sources
  sl.registerLazySingleton<StockDataSource>(
    () => StockDataSourceImpl(),
  );

  /// Repositories
  sl.registerLazySingleton<StockRepository>(
    () => StockRepositoryImpl(
      dataSource: sl<StockDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  /// Use cases
  sl.registerLazySingleton<GetIntradayTimeSeriesUseCase>(
    () => GetIntradayTimeSeriesUseCase(sl<StockRepository>()),
  );

  /// Blocs
  sl.registerSingleton<StockBloc>(
    StockBloc(sl<GetIntradayTimeSeriesUseCase>()),
  );
}

void _injectCore() {
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnection: sl<InternetConnection>()));
}

void _injectExternal() {
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());
  sl.registerLazySingleton<Dio>(() => BaseRepository.dio);
}
