import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/layout/home_screen.dart';
import 'package:news_app/observer.dart';
import 'package:news_app/providers/my_provider.dart';
import 'package:news_app/screens/article_details_screen.dart';
import 'package:news_app/screens/splash_screen.dart';
import 'package:news_app/shared/styles/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyProvider myProvider = MyProvider();
  await myProvider.setItems();
  Bloc.observer = MyBlocObserver();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => myProvider,
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        locale: Locale(provider.languageCode),
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        theme: AppTheme.appTheme,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          SplashScreen.routeName: (context) => const SplashScreen(),
          ArticleDetailsScreen.routeName: (context) => const ArticleDetailsScreen()
        },
      ),
    );
  }
}
