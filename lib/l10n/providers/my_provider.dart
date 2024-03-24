import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  late String languageCode;
  SharedPreferences? sharedPreferences;


  void changeLanguageCode(String langCode) {
    languageCode = langCode;
    if (langCode == 'ar') {
      saveLanguage(false);
    } else {
      saveLanguage(true);
    }
    notifyListeners();
  }

  Future<void> saveLanguage(bool isEnglish) async {
    await sharedPreferences!.setBool('isEnglish', isEnglish);
  }


  bool? getLanguage() {
    return sharedPreferences!.getBool('isEnglish');
  }

  Future<void> setItems() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (getLanguage() ?? false) {
      languageCode = 'en';
    } else {
      languageCode = 'ar';
    }
  }

}
