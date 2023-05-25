import 'package:ahamcare/model/profile_model/profile_model.dart';
import 'package:ahamcare/model/signup_model/signup_model.dart';
import 'package:ahamcare/services/otp_api_service/send_otp.dart';
import 'package:ahamcare/services/profile_service/profile_service.dart';
import 'package:ahamcare/services/signup_service/signup_service.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/view/otp_screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignUpController extends ChangeNotifier {
  final TextEditingController name = TextEditingController();
  final TextEditingController emailId = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  SignupServices signupServices = SignupServices();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool isLoading = false;
  // ProfileModel? model;
  ProfileModel? profiledetail;
  // SignupModel? user;

  Future<void> signupUser(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final model = SignupModel(
      email: emailId.text,
      password: password.text,
      phone: phoneNo.text,
      name: name.text,
    );

    OtpServices().sendOtp(model.phone, context).then((value) {
      if (value != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OtpScreen(
                model: model,
              );
            },
          ),
        );
        disposeTextfield();
      } else {
        return;
      }
    });

    isLoading = false;
    notifyListeners();
  }

  void getUserProfile(context) async {
    isLoading = true;
    notifyListeners();
    await ProfileService().profileService(context).then((value) {
      if (value != null) {
        profiledetail = value;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void disposeTextfield() {
    name.clear();
    emailId.clear();
    password.clear();
    phoneNo.clear();
    confirmPassword.clear();
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else {
      return null;
    }
  }

  String? emailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , please enter correct email';
    } else {
      return null;
    }
  }

  String? mobileValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length < 10) {
      return 'Invalid mobile number,make sure your entered 10 digits';
    } else {
      return null;
    }
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value.length > 16) {
      return 'Password exceeds 16 character';
    }
    return null;
  }

  String? confirmpasswordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value != password.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: AppColors.kBlack,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: AppColors.kBlack,
      );
      obscureText = true;
      notifyListeners();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: AppColors.kBlack,
      );
      obscureText = false;
      notifyListeners();
    }
  }
}
