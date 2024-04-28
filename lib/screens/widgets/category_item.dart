import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.categoryModel, required this.index});
  final CategoryModel categoryModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              categoryModel.categoryImage,
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: index.isOdd ? Radius.circular(25.r) : Radius.zero,
            bottomRight: index.isEven ? Radius.circular(25.r) : Radius.zero),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 160.h,
          bottom: 8.0.h,
        ),
        child: Text(
          categoryModel.categoryName,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge?.copyWith(fontSize: 21.sp),
        ),
      ),
    );
  }
}
