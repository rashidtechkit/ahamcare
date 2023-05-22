import 'package:ahamcare/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class ListtileWidget extends StatelessWidget {
  const ListtileWidget({
    super.key,
    this.title,
    this.trailing,
    this.tileColor,
    this.onTap,
    this.index,
  });
  final Widget? title;
  final Widget? trailing;
  final Color? tileColor;
  final Function()? onTap;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 2,
            top: 1,
            child: CircleAvatar(
              backgroundColor: AppColors.kDarkPink.withOpacity(0.5),
              radius: 15,
            ),
          ),
          Positioned(
            top: 20,
            left: 35,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.kDarkPink.withOpacity(0.5),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            onTap: onTap,
            tileColor: tileColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            title: title,
            trailing: trailing,
          ),
        ],
      ),
    );
  }
}
