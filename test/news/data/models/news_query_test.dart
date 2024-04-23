import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/domain/news/data/models/news_query.dart';

void main() {
  final query = NewsQuery(
    page: 1,
    category: "category",
    pageSize: 10,
  );

  test(
    "Given NewsQuery,"
    "When initialized,"
    "Then it should return correct values",
    () {
      expect(query.page, 1);
      expect(query.pageSize, 10);
      expect(query.category, "category");
    },
  );
}