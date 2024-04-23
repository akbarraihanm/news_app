import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/headlines/headlines_bloc.dart';
import 'package:news_app/blocs/headlines/headlines_event.dart';
import 'package:news_app/di/app_locator.dart';
import 'package:news_app/presentation/home/page/all_news_screen.dart';
import 'package:news_app/presentation/home/page/home_screen.dart';
import 'package:news_app/presentation/home/page/news_detail_screen.dart';
import 'package:news_app/presentation/home/param/all_news_param.dart';
import 'package:news_app/presentation/home/param/news_detail_param.dart';
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

      case AllNewsScreen.routeName: {
        final param = args as AllNewsParam;
        final scrollCtrl = ScrollController();

        child = BlocProvider(
          create: (_) {
            final bloc = HeadlinesBloc(sl());

            scrollCtrl.addListener(() {
              if (scrollCtrl.position.maxScrollExtent == scrollCtrl.offset) {
                bloc.add(PaginateHeadlines(param.category));
              }
            });

            bloc.add(GetHeadlines(param.category, 15));

            return bloc;
          },
          child: AllNewsScreen(param: param, scrollCtrl: scrollCtrl),
        );
      }

      case NewsDetailScreen.routeName: {
        final param = args as NewsDetailParam;
        child = NewsDetailScreen(param: param);
      }

      default: {
        child = const SplashScreen();
      }
    }

    return MaterialPageRoute(builder: (_) => child);
  }
}