// import 'package:flutter/material.dart';
// import 'package:news_app/utils/app_styles.dart';

// class DrawerItem extends StatelessWidget {
//   DrawerItem(
//       {super.key,
//       required this.text,
//       required this.image,
//       required this.onButtonClick});
//   String image;
//   String text;
//   Function onButtonClick;
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: width * 0.03),
//       child: Row(
//         children: [
//           Image.asset(image),
//           SizedBox(
//             width: width * 0.02,
//           ),
//           TextButton(
//               onPressed: () {
//                 // do some thinge
//                 onButtonClick();
//               },
//               child: Text(
//                 text,
//                 style: AppStyles.bold20white,
//               ))
//         ],
//       ),
//     );
//   }
// }
