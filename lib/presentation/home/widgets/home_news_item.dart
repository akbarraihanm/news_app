import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_typography.dart';
import 'package:news_app/core/const/asset_const.dart';
import 'package:news_app/domain/news/domain/entity/news_entity.dart';
import 'package:news_app/presentation/home/page/news_detail_screen.dart';
import 'package:news_app/presentation/home/param/news_detail_param.dart';

class HomeNewsItem extends StatelessWidget {
  final DataNewsEntity? data;

  const HomeNewsItem({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => Navigator.pushNamed(
          context,
          NewsDetailScreen.routeName,
          arguments: NewsDetailParam(data),
        ),
        child: Stack(
          children: [
            Image.network(
              data?.urlToImage ?? "",
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
                "${data?.title}",
                style: AppTypography.copyWith(
                  size: 16,
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
