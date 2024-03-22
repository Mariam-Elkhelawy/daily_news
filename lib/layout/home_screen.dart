import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/news_list_screen.dart';
import 'package:news_app/screens/categories_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/widgets/drawer_widget.dart';
import 'package:news_app/shared/styles/app_theme.dart';
import 'package:news_app/shared/widgets/custom_bg_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  bool isSettings = false;
  bool searching = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomBGWidget(
      child: Scaffold(
        appBar: searching
            ? AppBar(
                title: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(controller: searchController,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: theme.primaryColor),
                      cursorColor: theme.primaryColor,
                      cursorHeight: 25,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {
                            searching = false;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.close,
                            size: 30,
                            color: theme.primaryColor,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: theme.primaryColor,
                              size: 30,
                            ),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : AppBar(
                leadingWidth: 80,
                title: Text(
                  isSettings
                      ? 'Settings'
                      : categoryModel == null
                          ? 'News App'
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
                        icon: Icon(
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
                    categoryId: categoryModel?.id ?? '',text: searchController.text,
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
