import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/domain/news/data/models/news_response.dart';

class MockNewsResponse extends Mock implements NewsResponse {}
class MockNewsData extends Mock implements NewsData {}

void main() {
  final newsResponse = MockNewsResponse();
  final newsData = MockNewsData();

  test(
    "Given NewsResponse,"
    "When initialized,"
    "Then it should return correct values",
    () {
      /// Stub data
      when(() => newsResponse.status).thenReturn('ok');
      when(() => newsResponse.totalResults).thenReturn(10);

      expect(newsResponse.status, "ok");
      expect(newsResponse.totalResults, 10);
    },
  );

  test(
    "Given NewsData,"
    "When initialized"
    "Then it should return correct value",
    () {
      /// Stub data
      when(() => newsData.url).thenReturn("url");
      when(() => newsData.author).thenReturn("string");
      when(() => newsData.title).thenReturn("string");
      when(() => newsData.content).thenReturn("string");

      expect(newsData.url, "url");
      expect(newsData.author, "string");
      expect(newsData.title, "string");
      expect(newsData.content, "string");
    },
  );
}