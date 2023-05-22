import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/social_screen/social_screen.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidgetHome(
    String title1, String title2, BuildContext context, Widget? leading) {
  return AppBar(
    toolbarHeight: 80,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSize.kHeight10,
        TextWidget(
          name: title1,
          color: AppColors.kHelloBlue,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
        ),
        TextWidget(
          name: title2,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
        ),
      ],
    ),
    leading: leading,
    actions: [
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const SocialScreen();
              },
            ),
          );
        },
        child: const Image(
          height: 40,
          image: AssetImage('assets/images/heart.png'),
        ),
      ),
      // IconButton(
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) {
      //           return const SocialScreen();
      //         },
      //       ),
      //     );
      //   },
      //   icon: const Icon(
      //     Icons.favorite_border_outlined,
      //     color: AppColors.kBlack,
      //   ),
      // ),
      // InkWell(
      //   onTap: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) {
      //           return const ProfileScreen();
      //         },
      //       ),
      //     );
      //   },
      //   child: const CircleAvatar(
      //     backgroundColor: AppColors.kLightPink,
      //     radius: 18,
      //     child: CircleAvatar(
      //       radius: 15,
      //       backgroundImage:
      //           AssetImage('assets/images/pexels-pixabay-220453.jpg'),
      //     ),
      //   ),
      // ),
      AppSize.kWidth20,
    ],
  );
}
