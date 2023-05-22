import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidget(
    BuildContext context, String name, List<Widget> tabs, bool isScrollable) {
  return AppBar(
    toolbarHeight: 80,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
    title: TextWidget(
      name: name,
      fontWeight: FontWeight.bold,
      fontSize: 19,
    ),
    bottom: TabBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        indicatorPadding: EdgeInsets.all(5),
        isScrollable: isScrollable,
        labelColor: AppColors.kWhite,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.kPurple,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: AppColors.kBlack.withOpacity(0.5),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          letterSpacing: 0.8,
          fontFamily: "Poppins",
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: "Poppins",
        ),
        tabs: tabs),
  );
}
