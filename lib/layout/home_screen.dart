import 'package:flutter/material.dart';
import 'package:news_app/layout/custom_text_form_field.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/news_list_screen.dart';
import 'package:news_app/screens/categories_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/widgets/drawer_widget.dart';
import 'package:news_app/shared/widgets/custom_bg_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSettings = false;
  bool searching = false;
  String searchedVal = '';
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local = AppLocalizations.of(context)!;

    return CustomBGWidget(
      child: Scaffold(
        appBar: searching
            ? AppBar(
                title: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomTextFormField(
                      onChanged: (value) {
                        searchedVal = value;
                        setState(() {});
                      },
                      onPrefixPressed: () {
                        searching = false;
                        searchedVal = '';
                        setState(() {});
                      },
                      onSuffixPressed: () => setState(() {}),
                    ),
                  ),
                ),
              )
            : AppBar(
                leadingWidth: 80,
                title: Text(
                  isSettings
                      ? local.settings
                      : categoryModel == null
                          ? local.newsApp
                          : categoryModel!.categoryName,
                  style: theme.textTheme.bodyLarge,
                ),
                actions: [
                  if (categoryModel != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: IconButton(
                        onPressed: () {
                          searching = true;
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 45,
                        ),
                      ),
                    )
                ],
              ),
        drawer: !searching ? DrawerWidget(onTap: onDrawerClicked) : null,
        body: isSettings
            ? SettingsScreen()
            : categoryModel == null
                ? CategoriesScreen(
                    onCategoryTab: onCategoryTab,
                  )
                : NewsListScreen(
                    categoryId: categoryModel?.id ?? '',
                    text: searchedVal,
                  ),
      ),
    );
  }

  CategoryModel? categoryModel;

  onCategoryTab(model) {
    categoryModel = model;
    setState(() {});
  }

  onDrawerClicked(idIndex) {
    if (idIndex == DrawerWidget.categoryID) {
      isSettings = false;
      categoryModel = null;
      Navigator.pop(context);
      setState(() {});
    } else if (idIndex == DrawerWidget.settingsID) {
      categoryModel = null;
      isSettings = true;
      Navigator.pop(context);
      setState(() {});
    }
  }
}
