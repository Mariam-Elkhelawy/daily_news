import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/shared/widgets/custom_bg_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});
  static const String routeName = 'ArticleDetailsScreen';
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local = AppLocalizations.of(context)!;
    var article = ModalRoute.of(context)!.settings.arguments as Articles;
    return CustomBGWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            local.newsDetails,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade100,
                ),
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? '',
                    fit: BoxFit.fill,
                    height: 235,
                    width: double.infinity,
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      article.source?.name ?? '',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: const Color(0xFF79828B),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      article.title ?? '',
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                      child: Text(
                        article.publishedAt?.substring(0, 10) ?? '',
                        textAlign: TextAlign.end,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Color(0xFFA3A3A3), fontSize: 13),
                      ),
                    ),
                    SizedBox(height: 14),
                    Container(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 20, 10, 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            article.description ?? '',
                            style: theme.textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w300),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 30, 30, 0),
                            child: Text(
                              local.viewFullArticle,
                              style: theme.textTheme.bodySmall,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () async {
                                final Uri url = Uri.parse(article.url ?? '');
                                print(url);
                                if (!await launchUrl(url)) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                              child: Icon(
                                Icons.arrow_right_sharp,
                                size: 30,
                                color: Color(0xFF303030),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
