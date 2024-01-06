import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/stock_entity.dart';
import '../blocs/stock_bloc.dart';
import '../widgets/custom_line_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StockBloc _bloc = sl<StockBloc>();
  final List<StockEntity> _intradayTimeSeries = [];
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StockBloc>(
      create: (context) => _bloc,
      child: BlocConsumer<StockBloc, StockState>(
        listener: _blocListener,
        builder: (context, state) => GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            body: SafeArea(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Form(
                                key: _formKey,
                                child: Expanded(
                                  child: CustomTextField(
                                    controller: _controller,
                                    hint: 'Symbol eg: AAPL, GOOGL, IBM',
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Required.';
                                      }
                                      return null;
                                    },
                                    textCapitalization:
                                        TextCapitalization.characters,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              IconButton(
                                onPressed: _getIntradayTimeSeries,
                                icon: const Icon(Icons.send),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          _buildChart(),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChart() {
    if (_intradayTimeSeries.isEmpty) return const SizedBox();

    return Expanded(
      child: Column(
        children: [
          CustomLineChart(
            intradayTimeSeries: _intradayTimeSeries,
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Time')),
                    DataColumn(label: Text('Open')),
                    DataColumn(label: Text('High')),
                    DataColumn(label: Text('Low')),
                    DataColumn(label: Text('Close')),
                    DataColumn(label: Text('Volume')),
                  ],
                  rows: _intradayTimeSeries
                      .map(
                        (element) => DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(
                                Utils.getFormattedDate(element.time) ?? '',
                              ),
                            ),
                            DataCell(Text(element.open.toStringAsFixed(2))),
                            DataCell(Text(element.high.toStringAsFixed(2))),
                            DataCell(Text(element.low.toStringAsFixed(2))),
                            DataCell(Text(element.close.toStringAsFixed(2))),
                            DataCell(Text(element.volume.toString())),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _getIntradayTimeSeries() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == null || !isValid) return;

    _bloc.add(StockEvent.getIntradayTimeSeries(
        _controller.text.trim().toUpperCase()));
  }

  void _blocListener(BuildContext context, StockState state) {
    state.when(
      initial: () {},
      loading: () {
        _isLoading = true;
      },
      failure: (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
        _isLoading = false;
      },
      success: (entities) {
        _intradayTimeSeries.clear();
        _intradayTimeSeries.addAll(entities);
        _isLoading = false;
      },
    );
  }
}
