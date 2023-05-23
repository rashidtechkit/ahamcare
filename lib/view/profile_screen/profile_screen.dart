import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/controller/home_controller/old_age_home_controller.dart';
import 'package:ahamcare/controller/signup_controller/signup_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/profile_screen/add_profile_screen.dart';
import 'package:ahamcare/view/profile_screen/widgets/profile_tile.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:ahamcare/view/widgets/textfield_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Provider.of<SignUpController>(context, listen: false)
      //     .getUserProfile(context);
    });
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
              Icons.edit,
            ),
            label: const TextWidget(
              name: "Edit your profile",
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
              return value.isLoading == true
                  ? Column(
                      children: [
                        AppSize.kHeight40,
                        AppSize.kHeight40,
                        AppSize.kHeight40,
                        AppSize.kHeight40,
                        Center(child: const LoadingWidget()),
                      ],
                    )
                  : value.profiledetail == null
                      ? Text('data')
                      : Center(
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
                                    child: CircleAvatar(
                                      radius: 70,
                                      child: value.profiledetail
                                                  ?.profilePicture ==
                                              null
                                          ? CircleAvatar(
                                              radius: 75,
                                              child: Icon(Icons.person))
                                          : CircleAvatar(
                                              radius: 75,
                                              backgroundImage: NetworkImage(
                                                  '${ApiBaseUrl.cloudUrl}${value.profiledetail?.profilePicture}')),
                                    ),
                                  ),
                                  AppSize.kHeight10,
                                  FadeInUp(
                                    delay: const Duration(milliseconds: 500),
                                    child: TextWidget(
                                      name: value.profiledetail?.name ?? '',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  // FadeInUp(
                                  //   delay: const Duration(milliseconds: 700),
                                  //   child: TextWidget(
                                  //     name: value.profiledetail?.email ?? '',
                                  //     fontWeight: FontWeight.bold,
                                  //     fontSize: 15,
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: FadeInUp(
                                      delay: const Duration(milliseconds: 900),
                                      child: Material(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              FadeInUp(
                                                delay: const Duration(
                                                    milliseconds: 1000),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Spacer(),
                                                    // Row(
                                                    //   children: [
                                                    //     IconButton(
                                                    //       onPressed: () {},
                                                    //       icon: const Icon(
                                                    //         Icons.delete,
                                                    //       ),
                                                    //     ),
                                                    //     IconButton(
                                                    //       onPressed: () {},
                                                    //       icon: const Icon(
                                                    //         Icons.edit,
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              AppSize.kHeight10,
                                              FadeInUp(
                                                delay: const Duration(
                                                    milliseconds: 1200),
                                                child: ProfileTileWidget(
                                                  leading: CircleAvatar(
                                                    radius: 8,
                                                    backgroundColor:
                                                        AppColors.kDarkPink,
                                                  ),
                                                  title: TextWidget(
                                                    name: "Lives At",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  subtitle: TextWidget(
                                                    name: value.profiledetail
                                                            ?.address ??
                                                        '',
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              FadeInUp(
                                                delay: const Duration(
                                                    milliseconds: 1400),
                                                child: ProfileTileWidget(
                                                  leading: CircleAvatar(
                                                    radius: 8,
                                                    backgroundColor:
                                                        AppColors.kDarkPink,
                                                  ),
                                                  title: TextWidget(
                                                    name: "Work",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  subtitle: TextWidget(
                                                    name: value.profiledetail
                                                            ?.work ??
                                                        '',
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              FadeInUp(
                                                delay: const Duration(
                                                    milliseconds: 1600),
                                                child: ProfileTileWidget(
                                                  leading: CircleAvatar(
                                                    radius: 8,
                                                    backgroundColor:
                                                        AppColors.kDarkPink,
                                                  ),
                                                  title: TextWidget(
                                                    name: "Dob",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  subtitle: TextWidget(
                                                    name: value.profiledetail
                                                            ?.dateOfBirth ??
                                                        '',
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              FadeInUp(
                                                delay: const Duration(
                                                    milliseconds: 1800),
                                                child: ProfileTileWidget(
                                                  leading: const CircleAvatar(
                                                    radius: 8,
                                                    backgroundColor:
                                                        AppColors.kDarkPink,
                                                  ),
                                                  title: const TextWidget(
                                                    name: "Contact",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  subtitle: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.phone,
                                                          ),
                                                          AppSize.kWidth5,
                                                          TextWidget(
                                                              name: value
                                                                      .profiledetail
                                                                      ?.phoneNo ??
                                                                  ''),
                                                        ],
                                                      ),
                                                      AppSize.kHeight10,
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .email_outlined,
                                                          ),
                                                          AppSize.kWidth5,
                                                          TextWidget(
                                                              name: value
                                                                      .profiledetail
                                                                      ?.email ??
                                                                  ''),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    width: 1,
                                                  ),
                                                  FadeInUp(
                                                    delay: const Duration(
                                                        milliseconds: 1800),
                                                    child: TextButton(
                                                        onPressed: () {
                                                          showModalBottomSheet<
                                                              void>(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                height: 380,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: <
                                                                      Widget>[
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        const Text(
                                                                            'Change Password'),
                                                                        CircleAvatar(
                                                                          child:
                                                                              IconButton(
                                                                            icon:
                                                                                const Icon(Icons.close),
                                                                            onPressed: () =>
                                                                                Navigator.pop(context),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const TextfieldWidget(
                                                                      hintText:
                                                                          "current password",
                                                                      obscureText:
                                                                          false,
                                                                      contentPadding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              15),
                                                                      // suffixIcon:
                                                                      //     Icon(Icons
                                                                      //         .edit),
                                                                    ),
                                                                    const TextfieldWidget(
                                                                      hintText:
                                                                          "new password",
                                                                      obscureText:
                                                                          false,
                                                                      contentPadding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              15),
                                                                      // suffixIcon:
                                                                      //     Icon(Icons
                                                                      //         .edit),
                                                                    ),
                                                                    const TextfieldWidget(
                                                                      hintText:
                                                                          "confirm password",
                                                                      obscureText:
                                                                          false,
                                                                      contentPadding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              10,
                                                                          vertical:
                                                                              15),
                                                                      // suffixIcon:
                                                                      //     Icon(Icons
                                                                      //         .edit),
                                                                    ),
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () {},
                                                                        child: Text(
                                                                            'Submit'))
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons
                                                                .password_rounded),
                                                            AppSize.kWidth5,
                                                            Text(
                                                                'Change Password'),
                                                          ],
                                                        )),
                                                  ),
                                                  AppSize.kWidth40,
                                                ],
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
