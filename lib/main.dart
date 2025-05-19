import 'package:flutter/material.dart';
import 'package:news_app/provider/language_provider.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/ui/home/navigation/navigation_flags.dart';
import 'package:news_app/ui/home/news/news_full_artical.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => NavigationFlags()),
      ],
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsFullArtical.routeNewsFullArtical: (contex) => NewsFullArtical(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentTheme,
    );
  }
}
