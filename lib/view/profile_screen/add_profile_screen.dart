import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/button_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:ahamcare/view/widgets/textfield_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AddProfileScreen extends StatelessWidget {
  const AddProfileScreen({super.key});

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  AppSize.kHeight10,
                  ZoomIn(
                    child: CircleAvatar(
                      radius: 70,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(
                            radius: 70,
                            // backgroundImage: AssetImage(
                            //     "assets/images/pexels-pixabay-220453.jpg"),
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                          MaterialButton(
                            elevation: 10,
                            onPressed: () {},
                            color: AppColors.kWhite,
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.camera_alt,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  AppSize.kHeight30,
                  ZoomIn(
                    child: const TextfieldWidget(
                      hintText: "Name",
                      obscureText: false,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      suffixIcon: Icon(Icons.edit),
                    ),
                  ),
                  AppSize.kHeight20,
                  ZoomIn(
                    child: const TextfieldWidget(
                      suffixIcon: Icon(Icons.date_range),
                      hintText: "Dob",
                      obscureText: false,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                  ),
                  AppSize.kHeight20,
                  ZoomIn(
                    child: const TextfieldWidget(
                      hintText: "Work",
                      obscureText: false,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      suffixIcon: Icon(Icons.work),
                    ),
                  ),
                  AppSize.kHeight20,
                  ZoomIn(
                    child: const TextfieldWidget(
                      hintText: "Lives At",
                      obscureText: false,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      suffixIcon: Icon(
                        Icons.location_on,
                      ),
                    ),
                  ),
                  AppSize.kHeight20,
                  ZoomIn(
                    child: const TextfieldWidget(
                      hintText: "Email",
                      obscureText: false,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      suffixIcon: Icon(Icons.mail),
                    ),
                  ),
                  AppSize.kHeight20,
                  ZoomIn(
                    child: const TextfieldWidget(
                      hintText: "Contact",
                      obscureText: false,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      suffixIcon: Icon(Icons.phone),
                    ),
                  ),
                  AppSize.kHeight20,
                  ZoomIn(
                    child: const TextfieldWidget(
                      hintText: "Adhar No",
                      obscureText: false,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      suffixIcon: Icon(Icons.vertical_distribute_sharp ),
                    ),
                  ),
                  AppSize.kHeight20,
                  ZoomIn(
                    child: const TextfieldWidget(
                      hintText: "Pancard No",
                      obscureText: false,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      suffixIcon: Icon(Icons.dock_sharp),
                    ),
                  ),
                  AppSize.kHeight20,
                  ZoomIn(
                    child: ButtonWidget(
                      name: "Submit",
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                  ),
                  AppSize.kHeight10,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
