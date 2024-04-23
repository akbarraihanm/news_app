import 'package:news_app/core/network/api_exception.dart';
import 'package:news_app/core/util/resource.dart';
import 'package:news_app/domain/news/data/data_source/news_data_source.dart';
import 'package:news_app/domain/news/data/models/news_query.dart';
import 'package:news_app/domain/news/domain/entity/news_entity.dart';
import 'package:news_app/domain/news/domain/mapper.dart';
import 'package:news_app/domain/news/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource dataSource;

  NewsRepositoryImpl(this.dataSource);

  @override
  Future<Resource<NewsEntity>> getHeadlines(NewsQuery query) async {
    try {
      final result = await dataSource.getHeadlines(query);
      return Resource.success(result.toEntity());
    } catch (ex) {
      if (ex is NetworkException) {
        return Resource.networkError("${ex.prefix}${ex.message}");
      } else if (ex is UnauthorizedException) {
        return Resource.unauthorized(ex.message);
      } else if (ex is ErrorRequestException) {
        return Resource.error(ex.message);
      } else {
        return Resource.error("$ex");
      }
    }
  }

}