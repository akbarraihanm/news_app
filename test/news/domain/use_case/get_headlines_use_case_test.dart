import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/core/util/resource.dart';
import 'package:news_app/domain/news/data/models/news_query.dart';
import 'package:news_app/domain/news/domain/repository/news_repository.dart';
import 'package:news_app/domain/news/domain/use_case/get_headlines_use_case.dart';

import '../entity/news_entity_test.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late MockNewsRepository repository;
  late GetHeadlinesUseCase useCase;

  final entity = MockNewsEntity();
  final dataEntity = MockDataNewsEntity();

  final query = NewsQuery();

  setUpAll(() {
    repository = MockNewsRepository();
    useCase = GetHeadlinesUseCase(repository);
  });

  group('GetHeadlinesUseCase test', () {
    test(
      "Given GetHeadlinesUseCase,"
      "When call() called,"
      "Then it should return correct data",
      () async {
        when(() => repository.getHeadlines(query)).thenAnswer((_) async => Resource.success(entity));
        when(() => entity.status).thenReturn('ok');
        when(() => entity.totalResults).thenReturn(10);
        when(() => entity.articles).thenReturn([dataEntity]);
        when(() => dataEntity.title).thenReturn("string");
        when(() => dataEntity.urlToImage).thenReturn("string");
        when(() => dataEntity.url).thenReturn("string");

        final result = await useCase(query);

        expect(result.data?.status, entity.status);
        expect(result.data?.totalResults, entity.totalResults);
        expect(result.data?.articles?.first, entity.articles?.first);
      },
    );
  });
}