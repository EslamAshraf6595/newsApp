import 'package:flutter/material.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/ui/home/category_details/source_tab_name.dart';
import 'package:news_app/ui/home/navigation/navigation_flags.dart';
import 'package:news_app/ui/home/news/news_widget.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:provider/provider.dart';

class SourceTabWidget extends StatefulWidget {
  SourceTabWidget({super.key, required this.sourceList,required this.query});
  List<Source> sourceList;
  final String query;
 
  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;
  late NavigationFlags navigationFlagsProvider;

  @override
  Widget build(BuildContext context) {
    navigationFlagsProvider = Provider.of<NavigationFlags>(context);

    return widget.sourceList.isEmpty
        ? const Center(
            child: Text('No news sources available for this language.'),
          )
        : DefaultTabController(
            length: widget.sourceList.length,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Theme.of(context).indicatorColor,
                  dividerColor: Appcolors.transparentColor,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  tabs: widget.sourceList.map((source) {
                    return SourceTabName(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source),
                    );
                  }).toList(),
                ),
                Expanded(
                    child: NewsWidget(
                  source: widget.sourceList[selectedIndex],
                  query: widget.query,
                  
                )),
              ],
            ),
          );
  }
}
