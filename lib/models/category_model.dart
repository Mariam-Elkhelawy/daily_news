import 'dart:ui';

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

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: 'sports',
          categoryName: 'Sports',
          categoryImage: 'assets/images/sports.png',
          color: Color(0xFFC91C22)),
      CategoryModel(
          id: 'general',
          categoryName: 'Politics',
          categoryImage: 'assets/images/Politics.png',
          color: Color(0xFF003E90)),
      CategoryModel(
          id: 'health',
          categoryName: 'Health',
          categoryImage: 'assets/images/health.png',
          color: Color(0xFFED1E79)),
      CategoryModel(
          id: 'business',
          categoryName: 'Business',
          categoryImage: 'assets/images/bussines.png',
          color: Color(0xFFCF7E48)),
      CategoryModel(
          id: 'entertainment',
          categoryName: 'Entertainment',
          categoryImage: 'assets/images/environment.png',
          color: Color(0xFF4882CF)),
      CategoryModel(
          id: 'science',
          categoryName: 'Science',
          categoryImage: 'assets/images/science.png',
          color: Color(0xFFF2D352)),
    ];
  }
}
