import 'dart:developer';
import 'package:ahamcare/model/signup_model/signup_model.dart';
import 'package:ahamcare/services/otp_api_service/verify_otp.dart';
import 'package:ahamcare/services/signup_service/signup_service.dart';
import 'package:ahamcare/utils/error_popup/snackbar.dart';
import 'package:ahamcare/view/home_screen/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class VerifyOtpController extends ChangeNotifier {
  VerifyOtpService verifyOtpService = VerifyOtpService();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  bool isLoading = false;
  String code = '';

  void onSubmitCode(String submitCode) {
    log(submitCode);
    code = submitCode;
    notifyListeners();
  }

  void sumbitOtp(SignupModel model, String code, context) {
    if (code.length != 6) {
      SnackBarPop.popUp(context, 'Please enter the OTP', Colors.red);
    } else {
      isLoading = true;
      notifyListeners();
      verifyOtpService.verifyOtp(model.phone, code, context).then(
        (value) {
          if (value != null) {
            SignupServices().signupUser(model, context).then((value) {
              if (value != null) {
                storage.write(key: 'token', value: value.accessToken);
                storage.write(key: 'refreshToken', value: value.refreshToken);
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ), (route) => false);
                isLoading = false;
                notifyListeners();
              }
            });
          }
        },
      );
    }
  }
}
