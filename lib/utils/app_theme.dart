import 'package:flutter/material.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: Appcolors.blackcolor,
      indicatorColor: Appcolors.blackColor,
      scaffoldBackgroundColor: Appcolors.whiteColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: Appcolors.blackColor,
          iconTheme: IconThemeData(color: Appcolors.whiteColor),
          centerTitle: true), // AppBar Theme

      textTheme: TextTheme(
          displaySmall: AppStyles.bold16blue,
          titleSmall: AppStyles.bold16white,
          labelLarge: AppStyles.bold16Black,
          labelMedium: AppStyles.medium14Black,
          labelSmall: AppStyles.medium12gray,
          headlineMedium: AppStyles.medium24black,
          headlineLarge: AppStyles.medium20White));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: Appcolors.whiteColor,
      indicatorColor: Appcolors.whiteColor,
      scaffoldBackgroundColor: Appcolors.blackBgColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: Appcolors.whiteColor,
          iconTheme: IconThemeData(color: Appcolors.blackColor),
          centerTitle: true), // AppBar Theme

      textTheme: TextTheme(
          displaySmall: AppStyles.bold16blue,
          titleSmall: AppStyles.bold16Black,
          labelLarge: AppStyles.bold16white,
          labelMedium: AppStyles.medium14White,
          labelSmall: AppStyles.medium12gray,
          headlineMedium: AppStyles.medium24White,
          headlineLarge: AppStyles.medium20Black));
}
