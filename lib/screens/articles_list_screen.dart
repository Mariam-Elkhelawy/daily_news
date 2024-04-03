import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/bloc/cubit.dart';
import 'package:news_app/screens/bloc/states.dart';
import 'package:news_app/screens/widgets/source_item_widget.dart';
import 'package:news_app/screens/widgets/article_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/shared/styles/app_theme.dart';

class ArticlesListScreen extends StatelessWidget {
  ArticlesListScreen({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 12),
          child: DefaultTabController(
            length: HomeCubit.get(context).sources.length,
            child: TabBar(
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              onTap: (value) {
                HomeCubit.get(context).changeSelectedSourceIndex(value);
              },
              isScrollable: true,
              tabs: HomeCubit.get(context)
                  .sources
                  .map(
                    (e) => SourceItemWidget(
                        sources: e,
                        isSelected: HomeCubit.get(context).sources.elementAt(
                                HomeCubit.get(context).selectedIndex) ==
                            e),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ArticleItem(
                  articles: HomeCubit.get(context).articles[index]);
            },
            itemCount: HomeCubit.get(context).articles.length,
          ),
        )
      ],
    );
  }
}
