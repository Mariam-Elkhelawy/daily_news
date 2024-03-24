import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String categoryName;
  String categoryImage;
  Color color;
  CategoryModel(
      {required this.id,
      required this.categoryName,
      required this.categoryImage,
      required this.color});

  static List<CategoryModel> getCategories(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return [
      CategoryModel(
          id: 'sports',
          categoryName: local.sports,
          categoryImage: 'assets/images/sports.png',
          color: Color(0xFFC91C22)),
      CategoryModel(
          id: 'general',
          categoryName: local.politics,
          categoryImage: 'assets/images/Politics.png',
          color: Color(0xFF003E90)),
      CategoryModel(
          id: 'health',
          categoryName: local.health,
          categoryImage: 'assets/images/health.png',
          color: Color(0xFFED1E79)),
      CategoryModel(
          id: 'business',
          categoryName: local.business,
          categoryImage: 'assets/images/bussines.png',
          color: Color(0xFFCF7E48)),
      CategoryModel(
          id: 'entertainment',
          categoryName: local.entertainment,
          categoryImage: 'assets/images/environment.png',
          color: Color(0xFF4882CF)),
      CategoryModel(
          id: 'science',
          categoryName: local.science,
          categoryImage: 'assets/images/science.png',
          color: Color(0xFFF2D352)),
    ];
  }
}
