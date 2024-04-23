import 'package:news_app/di/app_locator.dart';
import 'package:news_app/domain/news/data/api/news_service.dart';
import 'package:news_app/domain/news/data/data_source/news_data_source.dart';
import 'package:news_app/domain/news/data/repository/news_repository_impl.dart';
import 'package:news_app/domain/news/domain/repository/news_repository.dart';
import 'package:news_app/domain/news/domain/use_case/get_headlines_use_case.dart';

class NewsLocator {
  NewsLocator() {
    sl.registerLazySingleton(() => NewsService());
    sl.registerLazySingleton<NewsDataSource>(() => NewsDataSourceImpl(sl()));
    sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(sl()));
    sl.registerLazySingleton(() => GetHeadlinesUseCase(sl()));
  }
}