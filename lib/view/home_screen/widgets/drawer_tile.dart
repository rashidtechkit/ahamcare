// import 'package:ahamcare/utils/colors/colors.dart';
// import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DrawerTileWidget extends StatelessWidget {
  const DrawerTileWidget({
    super.key,
    this.icon,
    required this.name,
    this.onPressed,
  });
  final IconData? icon;
  final String name;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: AppColors.kWhite,
      ),
      label: TextWidget(
        name: name,
        color: AppColors.kWhite,
      ),
    );
  }
}
