import 'package:flutter/material.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/ui/widget/app_confige_bootom_sheet.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/assets_manager.dart';
import 'package:provider/provider.dart';

class DrawerHome extends StatelessWidget {
  DrawerHome(
      {super.key,
      required this.onButtonClick,
      required this.getNewTheme,
      required this.getNewLanguage
      });

  final Function onButtonClick;
  final VoidCallback getNewTheme;
  final VoidCallback getNewLanguage;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    final Map<String, String> languages = {
      'ar': 'Arabic',
      'de': 'German',
      'en': 'English',
      'es': 'Spanish',
      'fr': 'French',
      'he': 'Hebrew',
      'it': 'Italian',
      'nl': 'Dutch',
      'no': 'Norwegian',
      'pt': 'Portuguese',
      'ru': 'Russian',
      'sv': 'Swedish',
      'ud': 'Urdu',
      'zh': 'Chinese',
    };

    return Column(
      children: [
        Container(
          height: height * 0.2,
          alignment: Alignment.center,
          color: Appcolors.whiteColor,
          child: Text(
            "News App",
            style: AppStyles.medium24black,
          ),
        ),
        SizedBox(height: height * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Row(
            children: [
              Image.asset(AssetsManager.home),
              SizedBox(width: width * 0.02),
              TextButton(
                onPressed: () {
                  onButtonClick();
                },
                child: Text(
                  "Go To Home",
                  style: AppStyles.bold20white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.01),
        Divider(endIndent: width * 0.04, indent: width * 0.04),
        SizedBox(height: height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Row(
            children: [
              Image.asset(AssetsManager.them),
              SizedBox(width: width * 0.02),
              Text(
                "Theme",
                style: AppStyles.bold20white,
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.01),
        AppConfigeBootomSheet(
          text:
              themeProvider.currentTheme == ThemeMode.light ? "Light" : "Dark",
          onClick: getNewTheme,
        ),
        Divider(endIndent: width * 0.04, indent: width * 0.04),
        SizedBox(height: height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Row(
            children: [
              Image.asset(AssetsManager.language),
              SizedBox(width: width * 0.02),
              TextButton(
                onPressed: () {
                  onButtonClick();
                },
                child: Text(
                  "Language",
                  style: AppStyles.bold20white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.01),
        AppConfigeBootomSheet(
          text: languages[languageProvider.currentLanguage] ?? 'English',
          onClick: getNewLanguage,
        ),
      ],
    );
  }
}
