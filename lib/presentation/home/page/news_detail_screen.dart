import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_color.dart';
import 'package:news_app/core/config/app_typography.dart';
import 'package:news_app/core/const/asset_const.dart';
import 'package:news_app/core/extensions/double_extension.dart';
import 'package:news_app/core/helper/datetime_formatter_helper.dart';
import 'package:news_app/core/widgets/app_bar/app_bar.dart';
import 'package:news_app/presentation/home/param/news_detail_param.dart';

class NewsDetailScreen extends StatelessWidget {
  static const routeName = "/news-detail";
  final NewsDetailParam param;

  const NewsDetailScreen({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.titled(
        title: "${param.data?.title}",
      ),
      body: ListView(
        children: [
          Image.network(
            param.data?.urlToImage ?? "",
            fit: BoxFit.fill,
            width: double.infinity,
            height: 30.fromHeightPct,
            errorBuilder: (_,__,___) {
              return Center(
                child: Image.asset(
                  AssetConst.icNews,
                  height: 30.fromHeightPct,
                  width: 30.fromHeightPct,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.spaceHeight,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateTimeFormatterHelper.tryParse(
                        dateTime: param.data?.publishedAt,
                      ),
                      style: AppTypography.copyWith(
                        size: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Source: ${param.data?.source?.name}",
                          style: AppTypography.copyWith(
                            size: 12,
                            color: Colors.grey,
                          ),
                        ),
                        4.spaceHeight,
                        Text(
                          "Author: ${param.data?.author}",
                          style: AppTypography.copyWith(
                            size: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                24.spaceHeight,
                Text(
                  "${param.data?.desc}",
                  style: AppTypography.copyWith(
                    color: AppColor.blueOcean,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          24.spaceHeight,
        ],
      ),
    );
  }
}
