import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/screens/article_details_screen.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.articles});
  Articles articles;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade100,
              ),
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: articles.urlToImage ?? '',
                  fit: BoxFit.fill,
                  height: 235,
                  width: double.infinity,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  )),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              articles.source?.name ?? '',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: const Color(0xFF79828B),
              ),
            ),
            Text(
              articles.title ?? '',
              style: theme.textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
