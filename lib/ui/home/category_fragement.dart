import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/utils/appColors.dart';

class CategoryFragement extends StatelessWidget {
  CategoryFragement({super.key, required this.onButtonClick});
  List<Category> categoruesList = [];
  Function onButtonClick;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    categoruesList = Category.getCategoryList(false);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: height * 0.01, vertical: width * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: height * 0.01, vertical: width * 0.01),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: height * 0.02,
              );
            },
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Stack(
                  alignment: (index % 2 == 0)
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  children: [
                    Image.asset(categoruesList[index].image),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01, vertical: height * 0.01),
                      decoration: BoxDecoration(
                        color: Appcolors.greyColor,
                        borderRadius: BorderRadius.circular(85),
                      ),
                      width: width * 0.39,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "View All",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontSize: 17),
                          ),
                          CircleAvatar(
                            backgroundColor: Appcolors.blackColor,
                            child: IconButton(
                                onPressed: () {
                                  //to change the content of the scraen/display the news type
                                  onButtonClick(categoruesList[index]);
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 25,
                                  color: Appcolors.whiteColor,
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: categoruesList.length,
          ))
        ],
      ),
    );
  }
}
