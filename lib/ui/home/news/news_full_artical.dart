import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_app/model/news_response.dart';
import 'package:intl/intl.dart';
import 'package:news_app/ui/home/navigation/navigation_flags.dart';
import 'package:provider/provider.dart';

class NewsFullArtical extends StatelessWidget {
  NewsFullArtical({
    super.key,
  });
  static const routeNewsFullArtical = 'NewsFullArtical';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var currentNewsProvider = Provider.of<NavigationFlags>(context);
    //var currentNews = ModalRoute.of(context)?.settings.arguments as News;//remove set sate

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.025, vertical: height * 0.02),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentNewsProvider.currentdataNews.description ?? '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              currentNewsProvider.currentdataNews.content ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Text(
                  "By: ",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "${_formatAuthorName(currentNewsProvider.currentdataNews.author)}",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
            Text(
              _formatPublishedDate(
                  currentNewsProvider.currentdataNews.publishedAt),
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              width: width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Bootstrap.facebook),
                  Icon(Bootstrap.twitter),
                  Icon(Icons.email),
                  Icon(Icons.link)
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Image.network(currentNewsProvider.currentdataNews.urlToImage ?? ''),
            Text(
              currentNewsProvider.currentdataNews.title ?? '',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              currentNewsProvider.currentdataNews.description ?? '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: height * 0.02,
            ),
          ],
        ),
      ),
    ));
  }

  String _formatAuthorName(String? fullName) {
    if (fullName == null || fullName.trim().isEmpty) return '';
    final parts = fullName.trim().split(RegExp(
        r'\s+')); //covert it to list "John Smith" becomes ['John', 'Smith']
    if (parts.length == 1)
      return parts
          .first; //If the name has only one word (e.g., "Madonna"), just return it
    return '${parts.first} ${parts.last}'; //else return the first and last words from the name list.
  }

  String _formatPublishedDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return '';
    try {
      DateTime parsedDate = DateTime.parse(dateStr);
      return DateFormat('MMMM dd, yyyy HH:mm:ss').format(parsedDate);
    } catch (e) {
      return '';
    }
  }
}
