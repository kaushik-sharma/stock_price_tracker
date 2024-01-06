import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/constants/keys.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../injection_container.dart';
import '../models/stock_model.dart';

abstract class StockDataSource {
  Future<List<StockModel>> getIntradayTimeSeries(String symbol);
}

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockModel>> getIntradayTimeSeries(String symbol) async {
    final response = await sl<Dio>().get<Map<String, dynamic>>(
      'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$symbol&interval=60min&slice=year1month1&apikey=$kApiKey',
    );

    if (response.statusCode != null && response.statusCode != 200) {
      throw const ServerException();
    }

    final Map<String, dynamic>? data = response.data!['Time Series (60min)'];

    if (data == null) throw const ServerException();

    return await compute<Map<String, dynamic>, List<StockModel>>(
        _getModelsFromJson, data);
  }

  List<StockModel> _getModelsFromJson(Map<String, dynamic> data) {
    final List<StockModel> models = [];
    for (final key in data.keys) {
      final map = (data[key] as Map<String, dynamic>)..addAll({'time': key});
      models.add(StockModel.fromJson(map));
    }
    return models;
  }
}
