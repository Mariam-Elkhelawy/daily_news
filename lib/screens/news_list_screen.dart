import 'package:flutter/material.dart';
import 'package:news_app/models/source_response_model.dart';
import 'package:news_app/screens/articles_list_screen.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/shared/styles/app_theme.dart';

class NewsListScreen extends StatelessWidget {
   NewsListScreen({super.key, required this.categoryId,required this.text});
  final String categoryId;
  String text;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: AppTheme.primaryColor));
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something Went Wrong'),
          );
        }
        List<Sources> sourcesList = snapshot.data?.sources ?? [];
        return ArticlesListScreen(sources: sourcesList,text: text,);
      },
    );
  }
}
