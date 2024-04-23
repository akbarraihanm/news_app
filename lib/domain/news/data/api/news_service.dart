import 'package:news_app/core/network/base_api_service.dart';
import 'package:news_app/core/network/http_helper.dart';
import 'package:news_app/core/network/url_helper.dart';
import 'package:news_app/domain/news/data/models/news_query.dart';
import 'package:news_app/domain/news/data/models/news_response.dart';

class NewsService extends HttpHelper with BaseApiService {
  Future<NewsResponse> getHeadlines(NewsQuery query) async {
    final map = await getMethod(URL.headline(query), header());
    return NewsResponse.fromJson(map);
  }
}