class NewsQuery {
  int? page;
  int? pageSize;
  String? category;

  NewsQuery({
    this.page = 1,
    this.pageSize = 5,
    this.category = "",
  });

  String toQuery() {
    return "&page=$page&pageSize=$pageSize&category=$category";
  }
}