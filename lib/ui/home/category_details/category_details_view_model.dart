import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/sourceResponse.dart';

class CategoryDetailsViweModel extends ChangeNotifier {
  List<Source>? sourceList;
  String? errorMessage;
  void getSources(
      String categoryID, String language, String search, int page) async {
    try {
      // sourceList = [];
      // errorMessage = '';
      var respons =
          await ApiManager.getSources(categoryID, language, search, page);
      if (respons?.status == 'error') {
        errorMessage = respons!.message!;
      } else {
        sourceList = respons!.sources!;
      }
    } catch (e) {
      errorMessage = "${e}";
    }
    notifyListeners();
  }
}
