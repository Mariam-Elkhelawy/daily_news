import 'package:flutter/material.dart';
import 'package:news_app/layout/home_screen.dart';
import 'package:news_app/screens/article_details_screen.dart';
import 'package:news_app/shared/styles/app_theme.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.appTheme,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ArticleDetailsScreen.routeName:(context)=>ArticleDetailsScreen()
      },
    );
  }
}

