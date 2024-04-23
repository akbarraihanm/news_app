import 'package:flutter/material.dart';
import 'package:news_app/presentation/home/page/home_screen.dart';
import 'package:news_app/presentation/splash/splash_screen.dart';

class RouteGenerator {
  static Route generate(RouteSettings settings) {
    final args = settings.arguments;
    final route = settings.name;
    late Widget child;

    switch (route) {
      case HomeScreen.routeName: {
        child = const HomeScreen();
      }

      default: {
        child = const SplashScreen();
      }
    }

    return MaterialPageRoute(builder: (_) => child);
  }
}