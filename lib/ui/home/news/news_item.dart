import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.news});
  News news;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: height * 0.01, vertical: width * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: height * 0.01, vertical: width * 0.01),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).indicatorColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => CircularProgressIndicator(
                color: Appcolors.greyColor,
              ), //in case whating
              errorWidget: (context, url, error) =>
                  Icon(Icons.error), // inacse error
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "By: ${_formatAuthorName(news.author)}",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              Text(
                maxLines: 2,
                news.publishedAt != null
                    ? timeago.format(DateTime.parse(
                        news.publishedAt!,
                      ))
                    : '',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          )
        ],
      ),
    );
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
}
