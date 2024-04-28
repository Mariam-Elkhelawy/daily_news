import 'package:Khabar/models/NewsDataModel.dart';
import 'package:Khabar/screens/widgets/article_item.dart';
import 'package:Khabar/screens/widgets/source_item_widget.dart';
import 'package:Khabar/shared/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/cubit.dart';

class ArticlesListScreen extends StatelessWidget {
  ArticlesListScreen({super.key, required this.text});
  String text;
  ScrollController controller = ScrollController();
  List<Articles> news = [];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Column(
      children: [
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 12.w),
          child: DefaultTabController(
            length: HomeCubit.get(context).sources.length,
            child: TabBar(
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              labelPadding: EdgeInsets.symmetric(horizontal: 6.w),
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
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: AppTheme.primaryColor,
                indent: 25.w,
                endIndent: 25.w,
                thickness: .5,
              );
            },
            controller: controller,
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
