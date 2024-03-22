import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.categoryModel, required this.index});
  CategoryModel categoryModel;
  int index;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: index.isOdd ? Radius.circular(25) : Radius.zero,
            bottomRight: index.isEven ? Radius.circular(25) : Radius.zero),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            categoryModel.categoryImage,
            fit: BoxFit.cover,
          ),
          Text(
            categoryModel.categoryName,
            style: theme.textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
