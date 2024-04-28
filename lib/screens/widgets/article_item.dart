import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/screens/article_details_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ArticleDetailsScreen.routeName,
              arguments: articles);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Container(
              width: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade100,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: articles.urlToImage ?? '',
                  fit: BoxFit.cover,
                  height: 100.h,
                  width: 120.w,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: theme.primaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 235.w,
                  child: Text(
                    articles.title ?? '',
                    maxLines: 3,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(fontSize: 16.sp, height: 1.h),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  articles.source?.name ?? '',
                  style: theme.textTheme.bodySmall?.copyWith(
                      color: const Color(0xFFA3A3A3), fontSize: 13.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  timeago.format(DateTime.parse(articles.publishedAt??'')),
                  style: theme.textTheme.bodySmall?.copyWith(
                      color: const Color(0xFFA3A3A3), fontSize: 13.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
