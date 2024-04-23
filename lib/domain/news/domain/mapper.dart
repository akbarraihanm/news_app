import 'package:news_app/domain/news/data/models/news_response.dart';
import 'package:news_app/domain/news/domain/entity/news_entity.dart';

extension SourceToEntity on Source {
  DataSourceEntity toEntity() => DataSourceEntity(
    id: id ?? "",
    name: name ?? "",
  );
}

extension NewsDataToEntity on NewsData {
  DataNewsEntity toEntity() => DataNewsEntity(
    url: url ?? "",
    author: author ?? "",
    content: content ?? "",
    desc: desc ?? "",
    publishedAt: publishedAt ?? "",
    source: source?.toEntity(),
    title: title ?? "",
    urlToImage: urlToImage ?? "",
  );
}

extension NewsToEntity on NewsResponse {
  NewsEntity toEntity() => NewsEntity(
    status: status ?? "",
    totalResults: totalResults ?? 0,
    articles: articles?.map((e) => e.toEntity()).toList(),
  );
}