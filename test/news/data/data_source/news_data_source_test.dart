import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/domain/news/data/api/news_service.dart';
import 'package:news_app/domain/news/data/data_source/news_data_source.dart';
import 'package:news_app/domain/news/data/models/news_query.dart';

import '../models/news_response_test.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  final service = MockNewsService();
  late NewsDataSource dataSource;

  final query = NewsQuery();
  final newsResponse = MockNewsResponse();
  final newsData = MockNewsData();

  setUpAll(() {
    dataSource = NewsDataSourceImpl(service);
  });

  group('News Data Source Test', () {
    test(
      "Given NewsDataSource,"
      "When getHeadlines() called,"
      "Then it should return correct data",
      () async {
        when(() => service.getHeadlines(query)).thenAnswer((_) async => newsResponse);
        when(() => newsResponse.articles).thenReturn([newsData]);
        when(() => newsData.content).thenReturn("string");
        when(() => newsData.title).thenReturn("string");

        final result = await dataSource.getHeadlines(query);

        expect(result.status, newsResponse.status);
        expect(result.totalResults, newsResponse.totalResults);
        expect(result.articles?.first, newsData);

        expect(result.articles?.first.content, "string");
        expect(result.articles?.first.title, "string");
      },
    );
  });
}