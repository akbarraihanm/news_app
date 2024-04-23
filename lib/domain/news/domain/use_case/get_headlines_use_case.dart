import 'package:news_app/core/util/resource.dart';
import 'package:news_app/core/util/use_case.dart';
import 'package:news_app/domain/news/data/models/news_query.dart';
import 'package:news_app/domain/news/domain/entity/news_entity.dart';
import 'package:news_app/domain/news/domain/repository/news_repository.dart';

class GetHeadlinesUseCase extends UseCase<NewsEntity, NewsQuery> {
  final NewsRepository repository;

  GetHeadlinesUseCase(this.repository);

  @override
  Future<Resource<NewsEntity>> call(NewsQuery param) {
    return repository.getHeadlines(param);
  }

}