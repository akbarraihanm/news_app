class NewsEntity {
  String? status;
  int? totalResults;
  List<DataNewsEntity>? articles;

  NewsEntity({
    this.status,
    this.totalResults,
    this.articles,
  });
}

class DataNewsEntity {
  DataSourceEntity? source;
  String? author;
  String? title;
  String? desc;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  DataNewsEntity({
    this.source,
    this.author,
    this.title,
    this.desc,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
}

class DataSourceEntity {
  String id;
  String name;

  DataSourceEntity({
    this.id = "",
    this.name = "",
  });
}