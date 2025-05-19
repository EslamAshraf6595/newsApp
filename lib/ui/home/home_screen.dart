import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/ui/drawer/drawer_home.dart';
import 'package:news_app/ui/drawer/language_Bottom_sheet.dart';
import 'package:news_app/ui/drawer/theme_Bottom_sheet%20copy.dart';
import 'package:news_app/ui/home/category_details/category_details.dart';
import 'package:news_app/ui/home/category_fragement.dart';
import 'package:news_app/ui/home/navigation/navigation_flags.dart';
import 'package:news_app/ui/home/news/news_full_artical.dart';
import 'package:news_app/ui/home/news/show_moda_lbottom_sheet_for_current_news.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/widget/custom_textForm_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NavigationFlags navigationFlagsProvider;
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    navigationFlagsProvider = Provider.of<NavigationFlags>(context);
    return Scaffold(
      appBar: navigationFlagsProvider.isClickedIcon == false
          ? AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selctedCategory == null ? 'Home' : selctedCategory!.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      navigationFlagsProvider.changeClickedIcon(true);
                    },
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
            )
          : AppBar(
              title: CustomTextformField(
              prefixicon: Icon(Icons.search),
              suffixicon: IconButton(
                onPressed: () {
                  navigationFlagsProvider.changeClickedIcon(false);
                  setState(() {
                    searchQuery = '';
                  });
                },
                icon: Icon(Icons.clear),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            )),
      drawer: Drawer(
          backgroundColor: Appcolors.blackColor,
          child: DrawerHome(
              onButtonClick: onDrawerMenuClick,
              getNewTheme: getNewTheme,
              getNewLanguage: showLanguageSheet)),
      body: selctedCategory == null
          ? CategoryFragement(
              onButtonClick: onCategoryClick,
            )
          : CategoryDetails(
                  category: selctedCategory!,
                  searchQuery: searchQuery,
                ),
    );
  }

  Category? selctedCategory;
  String selectedLanguage = 'English';

  void onCategoryClick(Category newCategory) {
    selctedCategory = newCategory;
    navigationFlagsProvider.changeStateOfBody(false);
    setState(() {});
  }

  void onDrawerMenuClick() {
    selctedCategory = null;
    navigationFlagsProvider.changeStateOfBody(false);
    Navigator.pop(context);
    setState(() {});
  }

  void getNewTheme() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
    // final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    // final isLight = themeProvider.currentTheme == ThemeMode.light;
    // themeProvider.changeTheme(isLight ? ThemeMode.dark : ThemeMode.light);
    setState(() {});
  }

  void showLanguageSheet() {
    var languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (_) => LanguageBottomSheet(
        onSelectLanguage: (String code) {
          print("Selected language: $code");
          if (selctedCategory != null) {
            selctedCategory!.languageCode = code;
          }
          languageProvider.changeLanguage(selctedCategory!.languageCode);
          print(
              "selctedCategory!.languageCode: ${selctedCategory!.languageCode!}");

          setState(() {});
        },
      ),
    );
  }
}
