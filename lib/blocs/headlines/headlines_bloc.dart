import 'package:bloc/bloc.dart';
import 'package:news_app/blocs/headlines/headlines_event.dart';
import 'package:news_app/blocs/headlines/headlines_state.dart';
import 'package:news_app/domain/news/data/models/news_query.dart';
import 'package:news_app/domain/news/domain/entity/news_entity.dart';
import 'package:news_app/domain/news/domain/use_case/get_headlines_use_case.dart';

class HeadlinesBloc extends Bloc<HeadlinesEvent, HeadlinesState> {
  final GetHeadlinesUseCase getHeadlines;
  List<DataNewsEntity> list = [];

  int page = 1;

  HeadlinesBloc(this.getHeadlines): super(LoadingHeadlines()) {
    on<GetHeadlines>((event, emit) async {
      page = 1;
      emit(LoadingHeadlines());

      final query = NewsQuery(
        pageSize: event.pageSize,
        category: event.category,
      );
      final result = await getHeadlines(query);

      result.when(
        onError: (msg) => emit(ErrorHeadlines(msg)),
        onUnauthorized: (msg) => emit(UnauthorizedHeadlines(msg)),
        onNetworkError: (msg) => emit(ErrorHeadlines(msg)),
        onSuccess: (data) {
          list = data?.articles ?? [];
          emit(InitHeadlines());
        },
      );
    });

    on<PaginateHeadlines>((event, emit) async {
      page++;
      final query = NewsQuery(
        pageSize: 15,
        category: event.category,
        page: page,
      );
      final result = await getHeadlines(query);

      result.when(
        onError: (msg) => emit(ErrorHeadlines(msg)),
        onUnauthorized: (msg) => emit(UnauthorizedHeadlines(msg)),
        onNetworkError: (msg) => emit(ErrorHeadlines(msg)),
        onSuccess: (data) {
          list.addAll(data?.articles ?? []);
          emit(InitHeadlines());
        },
      );
    });
  }

}