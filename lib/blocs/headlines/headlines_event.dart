abstract class HeadlinesEvent {}

class GetHeadlines extends HeadlinesEvent {
  String category;
  int pageSize;

  GetHeadlines(this.category, [this.pageSize = 5]);
}

class PaginateHeadlines extends HeadlinesEvent {
  String category;

  PaginateHeadlines(this.category);
}