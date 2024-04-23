class NewsResponse {
  String? status;
  int? totalResults;
  List<NewsData>? articles;

  NewsResponse.fromJson(Map<String, dynamic> map) {
    status = map['status'];
    totalResults = map['totalResults'];
    articles = map['articles'] == null? []: List
        .from(map['articles'].map((it) => NewsData.fromJson(it)));
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'totalResults': totalResults,
    'articles': articles?.map((e) => e.toJson()).toList(),
  };
}

class NewsData {
  Source? source;
  String? author;
  String? title;
  String? desc;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsData.fromJson(Map<String, dynamic> map) {
    source = map['source'] == null? null: Source.fromJson(map['source']);
    author = map['author'] ?? "No Author";
    title = map['title'] ?? "No Title";
    desc = map['description'] ?? "No Description";
    url = map['url'];
    urlToImage = map['urlToImage'];
    publishedAt = map['publishedAt'];
    content = map['content'] ?? "No Content";
  }

  Map<String, dynamic> toJson() => {
    'source': source?.toJson(),
    'author': author,
    'title': title,
    'description': desc,
    'url': url,
    'urlToImage': urlToImage,
    'publishedAt': publishedAt,
    'content': content,
  };
}

class Source {
  String? id;
  String? name;

  Source.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}