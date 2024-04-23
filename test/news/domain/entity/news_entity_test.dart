import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/domain/news/domain/entity/news_entity.dart';

class MockNewsEntity extends Mock implements NewsEntity {}
class MockDataNewsEntity extends Mock implements DataNewsEntity {}

void main() {
  final newsEntity = MockNewsEntity();
  final dataNewsEntity = MockDataNewsEntity();

  test(
    "Given NewsEntity,"
    "When initialized,"
    "Then it should return correct value",
    () {
      when(() => newsEntity.status).thenReturn("ok");
      when(() => newsEntity.totalResults).thenReturn(10);
      when(() => newsEntity.articles).thenReturn([dataNewsEntity]);
      when(() => dataNewsEntity.title).thenReturn("string");
      when(() => dataNewsEntity.content).thenReturn("string");

      expect(newsEntity.status, 'ok');
      expect(newsEntity.totalResults, 10);
      expect(newsEntity.articles?.first, dataNewsEntity);
      expect(newsEntity.articles?.first.title, 'string');
      expect(newsEntity.articles?.first.content, "string");
    },
  );
}