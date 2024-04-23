import 'package:flutter/material.dart';
import 'package:news_app/core/config/app_color.dart';
import 'package:news_app/core/config/app_typography.dart';
import 'package:news_app/core/const/asset_const.dart';
import 'package:news_app/domain/news/domain/entity/news_entity.dart';

class AllNewsItem extends StatelessWidget {
  final DataNewsEntity? data;

  const AllNewsItem({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(
          color: Colors.black12,
          blurRadius: 2,
          offset: Offset(2,2),
        )],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              data?.urlToImage ?? "",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 160,
              errorBuilder: (_,__,___) {
                return Center(
                  child: Image.asset(
                    AssetConst.icNews,
                    height: 160,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "${data?.title}",
              style: AppTypography.copyWith(
                color: AppColor.blueOcean,
                weight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
