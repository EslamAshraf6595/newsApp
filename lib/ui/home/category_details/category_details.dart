import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/ui/home/category_details/category_details_view_model.dart';
import 'package:news_app/ui/home/category_details/source_tab_widget.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails(
      {super.key, required this.category, required this.searchQuery});
  Category category;
  final String searchQuery;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  // void initState() {
  //   // TODO: implement initState

  //   viweModel.getSources(widget.category.id, widget.category.languageCode,
  //       widget.category.query, widget.category.page);
  // }

  CategoryDetailsViweModel viweModel = CategoryDetailsViweModel();
  @override
  Widget build(BuildContext context) {
    return 
      FutureBuilder<SourceResponse?>(
          future: ApiManager.getSources(
              widget.category.id,
              widget.category.languageCode,
              widget.category.query,
              widget.category.page),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Appcolors.greyColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text(
                    'Somthing Went Wrong',
                    style: AppStyles.medium20Black,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(
                            widget.category.id,
                            widget.category.languageCode,
                            widget.category.query,
                            widget.category.page);
                        setState(() {});
                      },
                      child: Text(
                        'Try Again',
                        style: AppStyles.medium20Black,
                      )),
                ],
              );
            }
            if (snapshot.data?.status != 'ok') {
              return Column(
                children: [
                  Text(
                    snapshot.data!.message!,
                    style: AppStyles.medium20Black,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(
                            widget.category.id,
                            widget.category.languageCode,
                            widget.category.query,
                            widget.category.page);
                        setState(() {});
                      },
                      child: Text(
                        'Try Again',
                        style: AppStyles.medium20Black,
                      )),
                ],
              );
            }
            var sourceList = snapshot.data?.sources ?? [];
            widget.category.query = widget.searchQuery;
            return SourceTabWidget(
                sourceList: sourceList, query: widget.category.query);
          });
  }
}
