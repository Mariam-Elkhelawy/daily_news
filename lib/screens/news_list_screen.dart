import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/screens/articles_list_screen.dart';
import 'package:news_app/screens/bloc/cubit.dart';
import 'package:news_app/screens/bloc/states.dart';
import 'package:news_app/shared/styles/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsListScreen extends StatelessWidget {
  NewsListScreen({super.key, required this.categoryId, required this.text});
  final String categoryId;
  String text;
  int page = 1;
  int pageSize = 10;
  List<Articles> news = [];

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => HomeCubit()..getSources(categoryId, context),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(
                  child:
                      CircularProgressIndicator(color: AppTheme.primaryColor),
                ),
              ),
            );
          }
          if (state is HomeGetSourcesErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(
                  child: Text(local.isError),
                ),
              ),
            );
          } else if (state is HomeGetSourcesSuccessState ||
              state is ChangeSelectedSource ||
              state is HomeGetNewsSuccessState) {
            HomeCubit.get(context).getNewsData(text, context, pageSize, page);
          }
        },
        builder: (context, state) {
          return ArticlesListScreen(text: text);
        },
      ),
    );
  }
}
