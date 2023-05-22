import 'package:ahamcare/controller/splash_controller/splash_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      ((timeStamp) {
        Provider.of<SplashController>(context, listen: false)
            .splashTimer(context);
      }),
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: MediaQuery.of(context).size.height * 0.05,
                      image: const AssetImage(
                        "assets/images/Aaham_Care_Logo__2_-1-removebg-preview.png",
                      ),
                    ),
                    AppSize.kWidth5,
                    const Text.rich(
                      TextSpan(
                        text: "Aaham",
                        style: TextStyle(
                          color: AppColors.kDarkPink,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "Care",
                            style: TextStyle(
                              color: AppColors.kPurple,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const TextWidget(
                  name: "Make your good deeds with us.",
                  fontWeight: FontWeight.w400,
                ),
                AppSize.kHeight10,
                LoadingAnimationWidget.threeRotatingDots(
                  color: AppColors.kPurple,
                  size: 30,
                ),
                AppSize.kHeight10,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
