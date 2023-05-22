import 'package:ahamcare/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class SnackBarPop {
  static Future<void> popUp(
      BuildContext context, String text, Color color) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: AppColors.kWhite),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
