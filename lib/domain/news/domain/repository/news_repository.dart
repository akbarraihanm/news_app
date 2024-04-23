import 'package:news_app/core/util/resource.dart';
import 'package:news_app/domain/news/data/models/news_query.dart';
import 'package:news_app/domain/news/domain/entity/news_entity.dart';

abstract class NewsRepository {
  Future<Resource<NewsEntity>> getHeadlines(NewsQuery query);
}