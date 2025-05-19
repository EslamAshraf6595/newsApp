import 'package:flutter/material.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: themeProvider.currentTheme == ThemeMode.light
                  ? SelectedTheme('Light')
                  : UnselectedTheme('Light'),
            ),
            SizedBox(height: height * 0.02),
            InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: themeProvider.currentTheme == ThemeMode.dark
                  ? SelectedTheme('Dark')
                  : UnselectedTheme('Dark'),
            ),
          ],
        ),
      ),
    );
  }

  Widget SelectedTheme(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Icon(Icons.check, size: 24),
      ],
    );
  }

  Widget UnselectedTheme(String text) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
