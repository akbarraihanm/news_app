import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/blocs/headlines/headlines_bloc.dart';
import 'package:news_app/blocs/headlines/headlines_event.dart';
import 'package:news_app/blocs/headlines/headlines_state.dart';
import 'package:news_app/core/config/app_color.dart';
import 'package:news_app/core/config/app_typography.dart';
import 'package:news_app/core/const/asset_const.dart';
import 'package:news_app/core/extensions/double_extension.dart';
import 'package:news_app/core/util/app_util.dart';
import 'package:news_app/core/widgets/app_bar/app_bar.dart';
import 'package:news_app/core/widgets/loading/app_loading.dart';
import 'package:news_app/di/app_locator.dart';
import 'package:news_app/presentation/home/page/all_news_screen.dart';
import 'package:news_app/presentation/home/param/all_news_param.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.titled(
        title: "News App",
        isBack: false,
      ),
      backgroundColor: AppColor.analogous,
      body: ListView(
        children: [
          16.spaceHeight,
          BlocProvider(
            create: (_) => HeadlinesBloc(sl())..add(GetHeadlines("")),
            child: BlocConsumer<HeadlinesBloc, HeadlinesState>(
              listener: (context, state) => state.when(
                onError: (msg) => Fluttertoast.showToast(msg: msg),
                onUnauthorized: (msg) => AppUtil.forceCloseApp(msg),
              ),
              builder: (context, state) {
                final bloc = context.read<HeadlinesBloc>();
                return state.buildWhen(
                  onLoading: const AppLoading(
                    margin: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onInit: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      height: 30.fromHeightPct,
                      initialPage: 0,
                      viewportFraction: 0.75,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                    items: bloc.list.map((e) => Stack(
                      children: [
                        Image.network(
                          e.urlToImage ?? "",
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 160,
                          errorBuilder: (_,__,___) {
                            return Center(
                              child: Image.asset(
                                AssetConst.icNews,
                                height: 40,
                                width: 40,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Text(
                            "${e.title}",
                            style: AppTypography.copyWith(
                              size: 16,
                              weight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )).toList(),
                  ),
                );
              },
            ),
          ),
          24.spaceHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Business",
                  style: AppTypography.copyWith(
                    size: 16,
                    weight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AllNewsScreen.routeName,
                    arguments: AllNewsParam('business'),
                  ),
                  child: Text(
                    "All Businesses",
                    style: AppTypography.copyWith(
                      weight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.spaceHeight,
          BlocProvider(
            create: (_) => HeadlinesBloc(sl())..add(GetHeadlines("business")),
            child: BlocConsumer<HeadlinesBloc, HeadlinesState>(
              listener: (context, state) => state.when(
                onError: (msg) => Fluttertoast.showToast(msg: msg),
                onUnauthorized: (msg) => AppUtil.forceCloseApp(msg),
              ),
              builder: (context, state) {
                final bloc = context.read<HeadlinesBloc>();
                return state.buildWhen(
                  onLoading: const AppLoading(
                    margin: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onInit: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      height: 17.5.fromHeightPct,
                      initialPage: 0,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                    items: bloc.list.map((e) => Stack(
                      children: [
                        Image.network(
                          e.urlToImage ?? "",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 160,
                          errorBuilder: (_,__,___) {
                            return Center(
                              child: Image.asset(
                                AssetConst.icNews,
                                height: 40,
                                width: 40,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Text(
                            "${e.title}",
                            style: AppTypography.copyWith(
                              size: 16,
                              weight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )).toList(),
                  ),
                );
              },
            ),
          ),
          16.spaceHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Technology",
                  style: AppTypography.copyWith(
                    size: 16,
                    weight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AllNewsScreen.routeName,
                    arguments: AllNewsParam('technology'),
                  ),
                  child: Text(
                    "All Technologies",
                    style: AppTypography.copyWith(
                      weight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.spaceHeight,
          BlocProvider(
            create: (_) => HeadlinesBloc(sl())..add(GetHeadlines("technology")),
            child: BlocConsumer<HeadlinesBloc, HeadlinesState>(
              listener: (context, state) => state.when(
                onError: (msg) => Fluttertoast.showToast(msg: msg),
                onUnauthorized: (msg) => AppUtil.forceCloseApp(msg),
              ),
              builder: (context, state) {
                final bloc = context.read<HeadlinesBloc>();
                return state.buildWhen(
                  onLoading: const AppLoading(
                    margin: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onInit: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      height: 17.5.fromHeightPct,
                      initialPage: 0,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                    items: bloc.list.map((e) => Stack(
                      children: [
                        Image.network(
                          e.urlToImage ?? "",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 160,
                          errorBuilder: (_,__,___) {
                            return Center(
                              child: Image.asset(
                                AssetConst.icNews,
                                height: 40,
                                width: 40,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Text(
                            "${e.title}",
                            style: AppTypography.copyWith(
                              size: 16,
                              weight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )).toList(),
                  ),
                );
              },
            ),
          ),
          16.spaceHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sports",
                  style: AppTypography.copyWith(
                    size: 16,
                    weight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AllNewsScreen.routeName,
                    arguments: AllNewsParam('sports'),
                  ),
                  child: Text(
                    "All Sports",
                    style: AppTypography.copyWith(
                      weight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.spaceHeight,
          BlocProvider(
            create: (_) => HeadlinesBloc(sl())..add(GetHeadlines("sports")),
            child: BlocConsumer<HeadlinesBloc, HeadlinesState>(
              listener: (context, state) => state.when(
                onError: (msg) => Fluttertoast.showToast(msg: msg),
                onUnauthorized: (msg) => AppUtil.forceCloseApp(msg),
              ),
              builder: (context, state) {
                final bloc = context.read<HeadlinesBloc>();
                return state.buildWhen(
                  onLoading: const AppLoading(
                    margin: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onInit: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      height: 17.5.fromHeightPct,
                      initialPage: 0,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                    items: bloc.list.map((e) => Stack(
                      children: [
                        Image.network(
                          e.urlToImage ?? "",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 160,
                          errorBuilder: (_,__,___) {
                            return Center(
                              child: Image.asset(
                                AssetConst.icNews,
                                height: 40,
                                width: 40,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Text(
                            "${e.title}",
                            style: AppTypography.copyWith(
                              size: 16,
                              weight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )).toList(),
                  ),
                );
              },
            ),
          ),
          24.spaceHeight,
        ],
      ),
    );
  }
}
