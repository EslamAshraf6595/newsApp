import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/ui/home/navigation/navigation_flags.dart';
import 'package:news_app/ui/home/news/news_full_artical.dart';
import 'package:news_app/ui/home/news/vews_web_view_screen.dart';
import 'package:provider/provider.dart';

class ShowModaLbottomSheetForCurrentNews extends StatefulWidget {
  ShowModaLbottomSheetForCurrentNews({
    super.key,
    required this.currentNewsItme,
  });
  // Function? onButtonClick;
  News currentNewsItme;

  @override
  State<ShowModaLbottomSheetForCurrentNews> createState() =>
      _ShowModaLbottomSheetForCurrentNewsState();
}

class _ShowModaLbottomSheetForCurrentNewsState
    extends State<ShowModaLbottomSheetForCurrentNews> {
  late NavigationFlags navigationFlagsProvider;

  @override
  Widget build(BuildContext context) {
    navigationFlagsProvider = Provider.of<NavigationFlags>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(8),
              child: Image.network(widget.currentNewsItme.urlToImage ?? ''),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(
              child: Text(
                getTruncatedDescription(widget.currentNewsItme.description),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {
                  //get full artical,
                  // navigationFlagsProvider.changeStateOfBody(true);
                  // navigationFlagsProvider.currentdataNews =
                  //     widget.currentNewsItme;
                  // Navigator.pop(context);
                  print('currentNewsItme.url:${widget.currentNewsItme.url} ');
                  if (widget.currentNewsItme.url != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsWebViewScreen(
                                url: widget.currentNewsItme.url!)));
                  }
                },
                child: Text(
                  'View Full Articel',
                  style: Theme.of(context).textTheme.titleSmall,
                ))
          ],
        ),
      ),
    );
  }

  String getTruncatedDescription(String? text) {
    if (text == null || text.isEmpty) return 'No description available.';

    const int maxChars = 150;
    if (text.length > maxChars) {
      int remaining = text.length - maxChars;
      return '${text.substring(0, maxChars)}... [+${remaining} chars]';
    } else {
      return text;
    }
  }
}
//don't make it navgate