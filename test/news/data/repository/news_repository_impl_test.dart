import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/domain/news/data/data_source/news_data_source.dart';
import 'package:news_app/domain/news/data/models/news_query.dart';
import 'package:news_app/domain/news/data/repository/news_repository_impl.dart';
import 'package:news_app/domain/news/domain/entity/news_entity.dart';
import 'package:news_app/domain/news/domain/mapper.dart';
import 'package:news_app/domain/news/domain/repository/news_repository.dart';

import '../models/news_response_test.dart';

class MockNewsDataSource extends Mock implements NewsDataSource {}

void main() {
  late MockNewsDataSource dataSource;
  late NewsRepository repository;

  final response = MockNewsResponse();
  final dataRes = MockNewsData();

  var entity = NewsEntity();

  setUpAll(() {
    dataSource = MockNewsDataSource();
    repository = NewsRepositoryImpl(dataSource);
  });

  final query = NewsQuery();

  group('NewsRepositoryImpl test', () {
    test(
      "Given NewsRepositoryImpl,"
      "When getHeadlines() called"
      "Then it should return correct data",
      () async {
        /// Stub response
        when(() => dataSource.getHeadlines(query)).thenAnswer((_) async => response);
        when(() => response.status).thenReturn('ok');
        when(() => response.totalResults).thenReturn(10);
        when(() => response.articles).thenReturn([dataRes]);

        /// Stub entity
        entity = response.toEntity();

        final result = await repository.getHeadlines(query);

        expect(entity.status, result.data?.status);
        expect(entity.totalResults, result.data?.totalResults);
        expect(entity.articles?.first.title, result.data?.articles?.first.title);
      },
    );
  });
}