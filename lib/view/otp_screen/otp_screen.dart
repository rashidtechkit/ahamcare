import 'package:ahamcare/controller/signup_controller/signup_controller.dart';
import 'package:ahamcare/controller/signup_controller/verify_otp.dart';
import 'package:ahamcare/model/signup_model/signup_model.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
    required this.model,
  });
  final SignupModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image.asset(
                //   'assets/images/1412_otp_verification.png',
                //   width: 300,
                // ),
                const Text(
                  'OTP Verification',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kBlack),
                ),
                const Text(
                  'Plaese enter the 6 digit code that \nwas send to your number  ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kBlack),
                ),
                AppSize.kHeight20,
                Consumer<VerifyOtpController>(
                  builder: (context, value, child) {
                    return OtpTextField(
                      textStyle: const TextStyle(color: Colors.black),
                      numberOfFields: 6,
                      borderColor: AppColors.kBlack,
                      enabledBorderColor: AppColors.kBlack,
                      borderRadius: BorderRadius.circular(12),
                      showFieldAsBox: true,
                      onSubmit: (String verificationCode) {
                        value.onSubmitCode(verificationCode);
                        // data.sumbitOtp(value.phoneNo.text, context);
                      },
                    );
                  },
                ),
                AppSize.kHeight20,
                Consumer2<VerifyOtpController, SignUpController>(
                  builder: (context, value, value2, child) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: ElevatedButton(
                        onPressed: () {
                          value.sumbitOtp(model, value.code, context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kBlack,
                        ),
                        child: const Text(
                          'Verify',
                          style: TextStyle(color: AppColors.kWhite),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
