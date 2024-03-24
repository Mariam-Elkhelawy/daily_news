import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/l10n/providers/my_provider.dart';
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/source_response_model.dart';
import 'package:news_app/shared/constants.dart';
import 'package:news_app/shared/network/remote/endPoints.dart';
import 'package:news_app/shared/styles/app_strings.dart';
import 'package:provider/provider.dart';

class ApiManager {
  static Future<SourceResponseModel> getSources(
      String categoryId, BuildContext context) async {
    // var provider = Provider.of<MyProvider>(context);

    Uri url = Uri.https(Constants.BASE_URL, EndPoints.sources, {
      AppString.apiKey: Constants.API_KEY_VALUE,
      AppString.category: categoryId,
      // AppString.language :provider.languageCode
    });
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourceResponseModel.fromJson(json);
  }

  static Future<NewsDataModel> getNewsData(
      String sourceId, String searchedVal, BuildContext context) async {
    // var provider = Provider.of<MyProvider>(context);

    Uri url = Uri.https(Constants.BASE_URL, EndPoints.newsData, {
      AppString.apiKey: Constants.API_KEY_VALUE,
      AppString.sources: sourceId,
      'q': searchedVal,
      // AppString.language :provider.languageCode
    });
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsDataModel.fromJson(json);
  }
}
