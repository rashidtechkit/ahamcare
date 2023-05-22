import 'package:ahamcare/controller/home_controller/all_details_controller.dart';
import 'package:ahamcare/controller/home_controller/all_organization_controller.dart';
import 'package:ahamcare/controller/home_controller/event_controller.dart';
import 'package:ahamcare/controller/home_controller/home_controller.dart';
import 'package:ahamcare/controller/home_controller/old_age_home_controller.dart';
import 'package:ahamcare/controller/home_controller/store_controller.dart';
import 'package:ahamcare/controller/login_controller/login_controller.dart';
import 'package:ahamcare/controller/map_controller/map_controller.dart';
import 'package:ahamcare/controller/payment_controller/payment_controller.dart';
import 'package:ahamcare/controller/signup_controller/signup_controller.dart';
import 'package:ahamcare/controller/signup_controller/verify_otp.dart';
import 'package:ahamcare/controller/social_controller/social_controller.dart';
import 'package:ahamcare/controller/splash_controller/splash_controller.dart';
import 'package:ahamcare/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'view/common_ngo_screens/common_listview_screen/all_common_details_view/all_details_view.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Logincontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpController(),
        ),
        ChangeNotifierProvider(
          create: (context) => VerifyOtpController(),
        ),
        ChangeNotifierProvider(
          create: (context) => OldAgeHomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashController(),
        ),
        ChangeNotifierProvider(
          create: (context) => StoreController(),
        ),
        ChangeNotifierProvider(
          create: (context) => EventController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SocialController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllOrganizationController(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetDetailsController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          fontFamily: "Poppins",
        ),
        home: const SplashScreen(),
        // routes: {
        //   AllCommonDetailsViewScreen.routeName: (context) {
        //     return const AllCommonDetailsViewScreen();
        //   },
        // },
      ),
    );
  }
}
