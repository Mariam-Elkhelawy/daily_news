import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String categoryName;
  String categoryImage;
  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
  });

  static List<CategoryModel> getCategories(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return [
      CategoryModel(
        id: 'sports',
        categoryName: local.sports,
        categoryImage: 'assets/images/sport.jpg',
      ),
      CategoryModel(
        id: 'general',
        categoryName: local.politics,
        categoryImage: 'assets/images/politics.jpg',
      ),
      CategoryModel(
        id: 'health',
        categoryName: local.health,
        categoryImage: 'assets/images/health.jpg',
      ),
      CategoryModel(
        id: 'business',
        categoryName: local.business,
        categoryImage: 'assets/images/business.jpg',
      ),
      CategoryModel(
        id: 'entertainment',
        categoryName: local.entertainment,
        categoryImage: 'assets/images/entertainment.jpg',
      ),
      CategoryModel(
        id: 'science',
        categoryName: local.science,
        categoryImage: 'assets/images/science.jpg',
      ),
    ];
  }
}
