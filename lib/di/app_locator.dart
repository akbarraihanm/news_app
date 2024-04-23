import 'package:get_it/get_it.dart';
import 'package:news_app/domain/news/di/app_locator.dart';

final sl = GetIt.instance;

class AppLocator {
  AppLocator() {
    NewsLocator();
  }
}