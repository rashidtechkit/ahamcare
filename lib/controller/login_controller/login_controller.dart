import 'package:ahamcare/model/login_model/login_model.dart';
import 'package:ahamcare/services/login_service/login_service.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/view/home_screen/home_screen.dart';
import 'package:ahamcare/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Logincontroller extends ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  LoginService loginServices = LoginService();
  bool isLoading = false;

  void logIn(BuildContext context) {
    isLoading = true;
    notifyListeners();
    final LoginModel loginModel = LoginModel(
      email: email.text,
      password: password.text,
    );
    loginServices.logInService(loginModel, context).then(
      (value) {
        if (value != null) {
          storage.write(key: 'token', value: value.accessToken);
          storage.write(key: 'refreshToken', value: value.refreshToken);
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ), (route) => false);
          disposeTextfield();
        } else {
          return;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void logOut(context) async {
    isLoading = true;
    notifyListeners();
    await storage.delete(key: 'token');
    await storage.delete(key: 'refreshToken');

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
    isLoading = false;
    notifyListeners();
  }

  bool obscureText = true;
  Icon icon = Icon(
    Icons.visibility_off,
    color: AppColors.kBlack.withOpacity(0.7),
  );

  void visibility() {
    if (obscureText == false) {
      icon = Icon(
        Icons.visibility_off,
        color: AppColors.kBlack.withOpacity(0.7),
      );
      obscureText = true;
      notifyListeners();
    } else {
      icon = Icon(
        Icons.visibility,
        color: AppColors.kBlack.withOpacity(0.7),
      );
      obscureText = false;
      notifyListeners();
    }
  }

  void disposeTextfield() {
    email.clear();
    password.clear();
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value.length > 8) {
      return 'Password exceeds 8 character';
    }
    return null;
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
}
