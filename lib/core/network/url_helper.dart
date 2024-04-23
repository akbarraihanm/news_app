import 'package:news_app/domain/news/data/models/news_query.dart';

class URL {
  static const _baseUrl = "https://newsapi.org/v2";
  static String headline([NewsQuery? query]) {
    return "$_baseUrl/top-headlines?country=us${query?.toQuery() ?? ""}";
  }
}