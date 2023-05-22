import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.name,
    this.height,
    this.width,
    this.fontSize,
    this.shape,
    this.onPressed,
  });
  final String name;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final double? fontSize;
  final OutlinedBorder? shape;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kBlue,
          elevation: 10,
          shape: shape,
        ),
        onPressed: onPressed,
        child: TextWidget(
          name: name,
          letterSpacing: 0.8,
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
