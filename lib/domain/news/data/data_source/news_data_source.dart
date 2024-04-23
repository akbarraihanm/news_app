import 'package:news_app/domain/news/data/api/news_service.dart';
import 'package:news_app/domain/news/data/models/news_query.dart';
import 'package:news_app/domain/news/data/models/news_response.dart';

abstract class NewsDataSource {
  Future<NewsResponse> getHeadlines(NewsQuery query);
}

class NewsDataSourceImpl implements NewsDataSource {
  final NewsService service;

  NewsDataSourceImpl(this.service);

  @override
  Future<NewsResponse> getHeadlines(NewsQuery query) {
    return service.getHeadlines(query);
  }
}