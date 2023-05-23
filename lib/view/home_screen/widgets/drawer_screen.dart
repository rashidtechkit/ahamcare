import 'package:ahamcare/controller/login_controller/login_controller.dart';
import 'package:ahamcare/controller/signup_controller/signup_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/about_screen/about_screen.dart';
import 'package:ahamcare/view/home_screen/home_screen.dart';
import 'package:ahamcare/view/home_screen/widgets/drawer_tile.dart';
import 'package:ahamcare/view/my_transaction_screen/my_transaction_screen.dart';
import 'package:ahamcare/view/profile_screen/profile_screen.dart';
import 'package:ahamcare/view/support_screen/support_screen.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});
  static final ZoomDrawerController z = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    final profile =
        Provider.of<SignUpController>(context, listen: false).profiledetail;
    return ZoomDrawer(
      controller: z,
      borderRadius: 24,
      style: DrawerStyle.defaultStyle,
      openCurve: Curves.fastOutSlowIn,
      showShadow: true,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      menuBackgroundColor: AppColors.kPurple,
      mainScreen: HomeScreen(controller: z),
      menuScreen: Scaffold(
        backgroundColor: AppColors.kPurple,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    z.close?.call();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: AppColors.kWhite,
                  ),
                ),
                AppSize.kHeight10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.kLightPink,
                      radius: 40,
                      child: CircleAvatar(
                        radius: 48,
                        // backgroundImage: AssetImage(
                        //     'assets/images/pexels-pixabay-220453.jpg'),
                        child: Icon(
                          Icons.person,
                          size: 35,
                        ),
                      ),
                    ),
                    AppSize.kHeight10,
                    TextWidget(
                      name: profile?.name ?? '',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kWhite,
                    ),
                    Divider(
                      color: AppColors.kWhite,
                      endIndent: 30,
                    ),
                  ],
                ),
                AppSize.kHeight30,
                DrawerTileWidget(
                  name: "Profile",
                  icon: Icons.account_circle,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const ProfileScreen();
                        },
                      ),
                    );
                  },
                ),
                AppSize.kHeight20,
                DrawerTileWidget(
                  name: "My Transactions",
                  icon: Icons.wallet_outlined,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const MyTransactionScreen();
                        },
                      ),
                    );
                  },
                ),
                AppSize.kHeight20,
                DrawerTileWidget(
                  name: "About",
                  icon: Icons.group,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const AboutScreen();
                        },
                      ),
                    );
                  },
                ),
                AppSize.kHeight20,
                DrawerTileWidget(
                  name: "Support",
                  icon: Icons.headset_mic_outlined,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const SupportScreen();
                        },
                      ),
                    );
                  },
                ),
                AppSize.kHeight30,
                Divider(
                  color: AppColors.kWhite,
                  endIndent: 30,
                ),
                AppSize.kHeight20,
                Consumer<Logincontroller>(
                  builder: (context, value, child) {
                    return DrawerTileWidget(
                      name: "LogOut",
                      icon: Icons.logout,
                      onPressed: () {
                        value.logOut(context);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
