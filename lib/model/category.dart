import 'package:news_app/utils/assets_manager.dart';

class Category {
  String id;
  String image;
  String title;
  String languageCode;
  String query;
  int page;

  Category({
    required this.id,
    required this.title,
    required this.image,
    this.query = '',
    this.page=1,
    this.languageCode = 'en',
  });
//you will net to get this from the site of the nwes API
//business entertainment general health science sports technology
  static List<Category> getCategoryList(bool isDark) {
    return [
      Category(
          id: 'general',
          title: 'General',
          image:
              isDark ? AssetsManager.generalDark : AssetsManager.generalLight),
      Category(
          id: 'business',
          title: 'Business',
          image: isDark
              ? AssetsManager.businessDark
              : AssetsManager.businessLight),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          image: isDark
              ? AssetsManager.entertainmentDark
              : AssetsManager.entertainmentLight),
      Category(
          id: 'health',
          title: 'Health',
          image: isDark ? AssetsManager.healthDark : AssetsManager.healthLight),
      Category(
          id: 'science',
          title: 'Science',
          image: isDark ? AssetsManager.scinceDark : AssetsManager.scinceLight),
      Category(
          id: 'technology',
          title: 'Technology',
          image: isDark
              ? AssetsManager.technologyDark
              : AssetsManager.technologyLight),
      Category(
          id: 'sports',
          title: 'Sports',
          image: isDark ? AssetsManager.sportDark : AssetsManager.sportLight),
    ];
  }
}
