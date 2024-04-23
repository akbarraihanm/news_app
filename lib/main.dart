import 'package:flutter/material.dart';
import 'package:news_app/core/route/route_generator.dart';
import 'package:news_app/di/app_locator.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  AppLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: RouteGenerator.generate,
      ),
    );
  }
}
