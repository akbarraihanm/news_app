import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:news_app/blocs/headlines/headlines_bloc.dart';
import 'package:news_app/blocs/headlines/headlines_event.dart';
import 'package:news_app/blocs/headlines/headlines_state.dart';
import 'package:news_app/core/extensions/double_extension.dart';
import 'package:news_app/core/util/app_util.dart';
import 'package:news_app/core/widgets/app_bar/app_bar.dart';
import 'package:news_app/core/widgets/loading/app_loading.dart';
import 'package:news_app/core/widgets/refresh/refresh_builder.dart';
import 'package:news_app/presentation/home/param/all_news_param.dart';
import 'package:news_app/presentation/home/widgets/all_news_item.dart';

class AllNewsScreen extends StatelessWidget {
  static const routeName = "/all-news";
  final AllNewsParam param;
  final ScrollController scrollCtrl;

  const AllNewsScreen({
    super.key,
    required this.param,
    required this.scrollCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.titled(
        title: "All ${toBeginningOfSentenceCase(param.category)}",
      ),
      body: BlocConsumer<HeadlinesBloc, HeadlinesState>(
        listener: (context, state) => state.when(
          onError: (msg) => Fluttertoast.showToast(msg: msg),
          onUnauthorized: (msg) => AppUtil.forceCloseApp(msg),
        ),
        builder: (context, state) {
          final bloc = context.read<HeadlinesBloc>();
          return state.buildWhen(
            onLoading: const AppLoading(),
            onInit: RefreshBuilder(
              controller: scrollCtrl,
              refresh: () => bloc.add(GetHeadlines(param.category, 15)),
              child: ListView.separated(
                itemCount: bloc.list.length,
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_,__) => 12.spaceHeight,
                itemBuilder: (context, pos) => AllNewsItem(
                  data: bloc.list[pos],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
