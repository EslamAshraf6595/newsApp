import 'package:flutter/material.dart';
import 'package:news_app/utils/appColors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppConfigeBootomSheet extends StatelessWidget {
  AppConfigeBootomSheet({super.key, required this.text,required this.onClick});
  Function onClick;
  String text;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: width * 0.03),
      padding: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: width * 0.03),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Appcolors.whiteColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppStyles.medium20White,
          ),
          IconButton(
              onPressed: () {
                onClick();
              },
              icon: Icon(
                Icons.arrow_drop_down,
                size: 25,
                color: Appcolors.whiteColor,
              ))
        ],
      ),
    );
  }
}
