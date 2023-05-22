import 'package:ahamcare/controller/signup_controller/signup_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/login_screen/login_screen.dart';
import 'package:ahamcare/view/widgets/button_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:ahamcare/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.kDarkPink,
            AppColors.kPurple,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -50,
                right: -50,
                child: CircleAvatar(
                  backgroundColor: AppColors.kBlack.withOpacity(0.1),
                  radius: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Transform.rotate(
                  alignment: Alignment.bottomRight,
                  angle: -0.3,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.kBlack.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Consumer<SignUpController>(
                    builder: (context, value, child) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formGlobalKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            AppSize.kHeight20,
                            const TextWidget(
                              name: "Create Account",
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: AppColors.kWhite,
                            ),
                            AppSize.kHeight30,
                            TextfieldWidget(
                              hintText: "Name",
                              controller: value.name,
                              keyboardType: TextInputType.name,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              suffixIcon: const Icon(
                                Icons.badge_rounded,
                              ),
                              obscureText: false,
                              errorStyle:
                                  const TextStyle(color: AppColors.kWhite),
                              validator: (p0) => value.nameValidation(p0),
                            ),
                            AppSize.kHeight30,
                            TextfieldWidget(
                              hintText: "Email",
                              keyboardType: TextInputType.emailAddress,
                              controller: value.emailId,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              suffixIcon: const Icon(
                                Icons.email_rounded,
                              ),
                              obscureText: false,
                              errorStyle:
                                  const TextStyle(color: AppColors.kWhite),
                              validator: (p0) => value.emailValdation(p0),
                            ),
                            AppSize.kHeight30,
                            TextfieldWidget(
                              hintText: "Phone number",
                              keyboardType: TextInputType.number,
                              controller: value.phoneNo,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              suffixIcon: const Icon(
                                Icons.phone,
                              ),
                              obscureText: false,
                              errorStyle:
                                  const TextStyle(color: AppColors.kWhite),
                              validator: (p0) => value.mobileValdation(p0),
                            ),
                            AppSize.kHeight30,
                            TextfieldWidget(
                              hintText: "Password",
                              keyboardType: TextInputType.visiblePassword,
                              controller: value.password,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    value.visibility();
                                  },
                                  icon: value.icon),
                              obscureText: value.obscureText,
                              errorStyle:
                                  const TextStyle(color: AppColors.kWhite),
                              validator: (p0) => value.passwordValdation(p0),
                            ),
                            AppSize.kHeight30,
                            TextfieldWidget(
                              hintText: "Confirm password",
                              keyboardType: TextInputType.visiblePassword,
                              controller: value.confirmPassword,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    value.visibility();
                                  },
                                  icon: value.icon),
                              obscureText: value.obscureText,
                              errorStyle:
                                  const TextStyle(color: AppColors.kWhite),
                              validator: (p0) =>
                                  value.confirmpasswordValdation(p0),
                            ),
                            AppSize.kHeight30,
                            ButtonWidget(
                              name: "Create account",
                              width: double.infinity,
                              fontSize: 18,
                              height: MediaQuery.of(context).size.height * 0.06,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              onPressed: () {
                                if (formGlobalKey.currentState!.validate()) {
                                  formGlobalKey.currentState!.save();

                                  value.signupUser(context);
                                }
                              },
                            ),
                            AppSize.kHeight30,
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ),
                                );
                              },
                              child: const TextWidget(
                                name: "Already have account? | login",
                                color: AppColors.kWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
