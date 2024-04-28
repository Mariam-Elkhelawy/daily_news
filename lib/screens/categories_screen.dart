import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/widgets/category_item.dart';
import 'package:news_app/shared/widgets/custom_bg_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.onCategoryTab});
  Function onCategoryTab;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local = AppLocalizations.of(context)!;
    List<CategoryModel> categories = CategoryModel.getCategories(context);
    return CustomBGWidget(
      child: Padding(
        padding:  EdgeInsetsDirectional.fromSTEB(25.w, 15.h, 25.w, 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
             local.pickCat,
              style: theme.textTheme.titleLarge?.copyWith(
                height: 1.5.h,
                fontSize: 22.sp,
                color: const Color(0xFF4F5A69),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.h,
                    mainAxisSpacing: 20.w,
                    childAspectRatio: 4 / 5),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onCategoryTab(categories[index]);
                    },
                    child: CategoryItem(
                      categoryModel: categories[index],
                      index: index,
                    ),
                  );
                },
                itemCount: categories.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
