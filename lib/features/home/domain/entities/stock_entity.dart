class StockEntity {
  final String time;
  final double open;
  final double high;
  final double low;
  final double close;
  final int volume;

  const StockEntity({
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });
}
