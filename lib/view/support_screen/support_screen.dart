import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: FadeInUp(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                      'assets/images/75663-call-center-support-lottie-animation.json',
                      height: 320),
                  AppSize.kHeight20,
                  const TextWidget(
                    name: "AahamCare Support",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  AppSize.kHeight30,
                  const TextWidget(
                    textAlign: TextAlign.center,
                    name:
                        "We're here to help and answer any\nquestions you might have.",
                    fontSize: 16,
                  ),
                  AppSize.kHeight10,
                  const TextWidget(
                    name: "We look forward to hearing from you.",
                  ),
                  AppSize.kHeight30,
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPurple,
                    ),
                    child: const TextWidget(
                      name: "Send Email",
                      color: AppColors.kWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
