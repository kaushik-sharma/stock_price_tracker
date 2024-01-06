import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;

final kScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  di.init();
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stock Price Tracker',
        scaffoldMessengerKey: kScaffoldMessengerKey,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
