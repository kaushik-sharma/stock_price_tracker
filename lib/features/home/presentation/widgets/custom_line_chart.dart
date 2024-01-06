import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/stock_entity.dart';

class CustomLineChart extends StatefulWidget {
  final List<StockEntity> intradayTimeSeries;

  const CustomLineChart({super.key, required this.intradayTimeSeries});

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  // todo
  final List<StockEntity> _sortedIntradayTimeSeries = [];
  late final double _minHigh;

  @override
  void initState() {
    super.initState();

    _sortedIntradayTimeSeries.addAll(
      [...widget.intradayTimeSeries.reversed],
    );

    double min = _sortedIntradayTimeSeries[0].high;
    for (final element in _sortedIntradayTimeSeries) {
      if (element.high < min) {
        min = element.high;
      }
    }
    _minHigh = min;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.h,
      child: LineChart(
        LineChartData(
          minX: 0.0,
          minY: _minHigh,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.2),
                strokeWidth: 0.5,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.2),
                strokeWidth: 0.5,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30.r,
                interval: 10,
                getTitlesWidget: _buildBottomTitle,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40.r,
                getTitlesWidget: _buildLeftTitle,
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: _getFlSpots(),
              isCurved: true,
              gradient: const LinearGradient(
                colors: [
                  Colors.teal,
                  Colors.cyan,
                ],
              ),
              barWidth: 1.w,
              isStrokeCapRound: true,
              dotData: const FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.withOpacity(0.2),
                    Colors.cyan.withOpacity(0.2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _getFlSpots() {
    final List<FlSpot> spots = [];
    double xOff = 0.0;
    for (final element in _sortedIntradayTimeSeries) {
      spots.add(FlSpot(xOff, element.high));
      xOff += 0.1;
    }
    return spots;
  }

  Widget _buildBottomTitle(double value, TitleMeta meta) {
    return Text(
      DateTime.parse(_sortedIntradayTimeSeries[value.toInt()].time)
          .year
          .toString(),
      style: TextStyle(
        fontSize: 12.sp,
      ),
    );
  }

  Widget _buildLeftTitle(double value, TitleMeta meta) {
    return Text(
      value.toInt().toString(),
      style: TextStyle(
        fontSize: 12.sp,
      ),
    );
  }
}
