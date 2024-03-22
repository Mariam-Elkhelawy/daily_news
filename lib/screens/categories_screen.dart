import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/widgets/category_item.dart';
import 'package:news_app/shared/widgets/custom_bg_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.onCategoryTab});
  Function onCategoryTab;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<CategoryModel> categories = CategoryModel.getCategories();
    return CustomBGWidget(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(25, 15, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pick your category \nof interest',
              style: theme.textTheme.titleLarge?.copyWith(
                height: 1.5,
                fontSize: 22,
                color: Color(0xFF4F5A69),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
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
