import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/sourceResponse.dart';

class NavigationFlags extends ChangeNotifier {
  bool clicked = false;
  News currentdataNews = News();
  bool isClickedIcon = false;

  void changeStateOfBody(bool isClicked) {
    clicked = isClicked;

    notifyListeners();
  }

  void changeClickedIcon(bool isClicked) {
    isClickedIcon = isClicked;

    notifyListeners();
  }
}
