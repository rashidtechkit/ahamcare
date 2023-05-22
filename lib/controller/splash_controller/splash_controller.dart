import 'dart:async';
import 'dart:developer';
import 'package:ahamcare/view/home_screen/widgets/drawer_screen.dart';
import 'package:ahamcare/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashController extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  String? signinCheck;

  void splashTimer(context) {
    Timer(
      const Duration(seconds: 3),
      () async {
        signinCheck = await storage.read(key: 'token');
        log(signinCheck.toString());
        if (signinCheck != null) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) {
              return const DrawerScreen();
            },
          ), (route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ), (route) => false);
        }
      },
    );
  }
}
