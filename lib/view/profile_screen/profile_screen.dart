import 'package:ahamcare/controller/home_controller/old_age_home_controller.dart';
import 'package:ahamcare/controller/signup_controller/signup_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/profile_screen/add_profile_screen.dart';
import 'package:ahamcare/view/profile_screen/widgets/profile_tile.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const TextWidget(
          name: "Profile",
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
          fontSize: 20,
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const AddProfileScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.add_circle,
            ),
            label: const TextWidget(
              name: "Add your profile",
              fontWeight: FontWeight.w500,
            ),
          ),
          AppSize.kWidth20,
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<SignUpController>(
            builder: (context, value, child) {
              return Center(
                child: Stack(
                  children: [
                    const Positioned(
                      left: -50,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.kLightPink,
                      ),
                    ),
                    const Positioned(
                      top: 100,
                      right: -50,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.kLightPink,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppSize.kHeight10,
                        FadeInDown(
                          child: const CircleAvatar(
                            radius: 80,
                            child: CircleAvatar(
                              radius: 75,
                              backgroundImage: AssetImage(
                                  "assets/images/pexels-pixabay-220453.jpg"),
                            ),
                          ),
                        ),
                        AppSize.kHeight10,
                        FadeInUp(
                          delay: const Duration(milliseconds: 500),
                          child: const TextWidget(
                            name: 'George',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 700),
                          child: const TextWidget(
                            name: "Senior Software Developer",
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: FadeInUp(
                            delay: const Duration(milliseconds: 900),
                            child: Material(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    FadeInUp(
                                      delay: const Duration(milliseconds: 1000),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Spacer(),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.delete,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.edit,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppSize.kHeight10,
                                    FadeInUp(
                                      delay: const Duration(milliseconds: 1200),
                                      child: const ProfileTileWidget(
                                        leading: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: AppColors.kDarkPink,
                                        ),
                                        title: TextWidget(
                                          name: "Lives At",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        subtitle: TextWidget(
                                          name:
                                              "Near NH Road,Maheswari Temple,Jalahalli,Ms Palaya,Bangalore.",
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    FadeInUp(
                                      delay: const Duration(milliseconds: 1400),
                                      child: const ProfileTileWidget(
                                        leading: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: AppColors.kDarkPink,
                                        ),
                                        title: TextWidget(
                                          name: "Work",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        subtitle: TextWidget(
                                          name:
                                              "Near NH Road,Maheswari Temple,Jalahalli,Ms Palaya,Bangalore.",
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    FadeInUp(
                                      delay: const Duration(milliseconds: 1600),
                                      child: const ProfileTileWidget(
                                        leading: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: AppColors.kDarkPink,
                                        ),
                                        title: TextWidget(
                                          name: "Age",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        subtitle: TextWidget(
                                          name: "20 years",
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    FadeInUp(
                                      delay: const Duration(milliseconds: 1800),
                                      child: ProfileTileWidget(
                                        leading: const CircleAvatar(
                                          radius: 8,
                                          backgroundColor: AppColors.kDarkPink,
                                        ),
                                        title: const TextWidget(
                                          name: "Contact",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        subtitle: Column(
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.phone,
                                                ),
                                                AppSize.kWidth5,
                                                TextWidget(name: "9866552380"),
                                              ],
                                            ),
                                            AppSize.kHeight10,
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.email_outlined,
                                                ),
                                                AppSize.kWidth5,
                                                TextWidget(
                                                    name: "george43@gmail.com"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    AppSize.kHeight10,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
