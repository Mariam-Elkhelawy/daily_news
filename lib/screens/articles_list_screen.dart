import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/source_response_model.dart';
import 'package:news_app/screens/widgets/source_item_widget.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/screens/widgets/article_item.dart';
import 'package:news_app/shared/styles/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticlesListScreen extends StatefulWidget {
  ArticlesListScreen({super.key, required this.sources,required this.text});
  List<Sources> sources;
String text;
  @override
  State<ArticlesListScreen> createState() => _ArticlesListScreenState();
}

class _ArticlesListScreenState extends State<ArticlesListScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 12),
          child: DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              isScrollable: true,
              tabs: widget.sources
                  .map(
                    (e) => SourceItemWidget(
                        sources: e,
                        isSelected:
                            widget.sources.elementAt(selectedIndex) == e),
                  )
                  .toList(),
            ),
          ),
        ),
        FutureBuilder(
          future:
              ApiManager.getNewsData(widget.sources[selectedIndex].id ?? '',widget.text,context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator(color: AppTheme.primaryColor));
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(local.isError),
              );
            }
            List<Articles> articlesList = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ArticleItem(articles: articlesList[index]);
                },
                itemCount: articlesList.length,
              ),
            );
          },
        )
      ],
    );
  }
}
