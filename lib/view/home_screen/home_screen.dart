import 'package:ahamcare/controller/home_controller/home_controller.dart';
import 'package:ahamcare/controller/signup_controller/signup_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/common_ngo_screens/ngo_screens.dart';
import 'package:ahamcare/view/home_screen/widgets/listtile_home.dart';
import 'package:ahamcare/view/store_events_screen/event_screen/event_screen.dart';
import 'package:ahamcare/view/store_events_screen/store_events_screen.dart';
import 'package:ahamcare/view/widgets/appbar_widget.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.controller});
  final ZoomDrawerController? controller;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).getHome(context);
      // Provider.of<SignUpController>(context,listen: false).getUserProfile(context);
    });
    return Consumer2<SignUpController, HomeController>(
      builder: (context, value, home, child) {
        return Scaffold(
          appBar: appBarWidgetHome(
            "Hello!",
            value.profiledetail?.name??'',
            context,
            IconButton(
              onPressed: () {
                controller!.toggle!() ?? '';
              },
              icon: const Icon(Icons.grid_view_outlined),
            ),
          ),
          body: SafeArea(
            child: Consumer<HomeController>(
              builder: (context, value, child) {
                return value.isLoading == true
                    ? const LoadingWidget()
                    : home.homeList.isEmpty
                        ? const EmptyWidget()
                        : SmartRefresher(
                            enablePullDown: true,
                            header: const WaterDropMaterialHeader(),
                            onRefresh: () {
                              value.getHome(context);
                            },
                            controller: refreshController,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  children: [
                                    AppSize.kHeight20,
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.kLightPink
                                            .withOpacity(0.3),
                                      ),
                                      child: Row(
                                        children: [
                                          const Image(
                                            height: 150,
                                            image: AssetImage(
                                                "assets/images/globalization-concept-illustration_114360-8511-removebg-preview.png"),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const TextWidget(
                                                name:
                                                    "We finds the\nbest way for your\ndeeds",
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.8,
                                              ),
                                              AppSize.kHeight10,
                                              SizedBox(
                                                height: 25,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.32,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppColors.kBlue,
                                                    elevation: 10,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  child: const TextWidget(
                                                    name: "Let's Connect",
                                                    letterSpacing: 0.8,
                                                    color: AppColors.kWhite,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppSize.kHeight30,
                                    ListtileWidget(
                                      tileColor: AppColors.kPurple,
                                      title: const TextWidget(
                                        name: ' Store and Events',
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.kWhite,
                                        fontSize: 18,
                                      ),
                                      trailing: const Material(
                                        elevation: 10,
                                        color: Colors.transparent,
                                        shape: CircleBorder(),
                                        child: Icon(
                                          Icons.arrow_circle_right_rounded,
                                          color: AppColors.kWhite,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return const StroreEventsScreen();
                                          },
                                        ));
                                      },
                                    ),
                                    AppSize.kHeight30,
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return ListtileWidget(
                                          tileColor: AppColors.kPurple,
                                          title: TextWidget(
                                            name: value.homeList[index].name,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.kWhite,
                                            fontSize: 18,
                                          ),
                                          trailing: const Material(
                                            elevation: 10,
                                            color: Colors.transparent,
                                            shape: CircleBorder(),
                                            child: Icon(
                                              Icons.arrow_circle_right_rounded,
                                              color: AppColors.kWhite,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) {
                                                return CommonNgoScreen(
                                                  id: value.homeList[index].id,
                                                  title: value
                                                      .homeList[index].name,
                                                );
                                              },
                                            ));
                                          },
                                        );
                                      },
                                      itemCount: value.homeList.length,
                                      separatorBuilder: (context, index) {
                                        return AppSize.kHeight20;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
              },
            ),
          ),
          bottomNavigationBar: const Image(
            image: AssetImage(
              "assets/images/modern-society-future-symbols_1343-811-removebg-preview.png",
            ),
          ),
        );
      },
    );
  }
}
