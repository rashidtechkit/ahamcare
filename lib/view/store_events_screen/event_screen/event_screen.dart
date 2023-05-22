import 'package:ahamcare/controller/home_controller/event_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<EventController>(context, listen: false).getEvent(context);
    });
    return Scaffold(
      body: SafeArea(
        child: Consumer<EventController>(
          builder: (context, value, child) {
            return value.isLoading == true
                ? const LoadingWidget()
                : RefreshIndicator(
                    onRefresh: () {
                      return value.getEvent(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              radius: 50,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 50,
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/admission-tickets-svgrepo-com.svg",
                                    height: 30,
                                    width: 30,
                                  ),
                                  AppSize.kWidth10,
                                  TextWidget(
                                    name: "All Available Events",
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.kBlack.withOpacity(0.5),
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              AppSize.kHeight10,
                              Expanded(
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ZoomIn(
                                      child: Card(
                                        elevation: 10,
                                        color: AppColors.kWhite,
                                        surfaceTintColor: AppColors.kWhite,
                                        child: ListTile(
                                          
                                          title: TextWidget(
                                              name:
                                                  value.eventList[index].event),
                                          subtitle: TextWidget(
                                            name: value
                                                .eventList[index].totalTickets
                                                .toString(),
                                            color: AppColors.kBlack
                                                .withOpacity(0.6),
                                          ),
                                          leading: Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: AppColors.kLightPink,
                                              image: const DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/images/hand-with-mock-up-music-fest-bracelet-tickets_23-2149382309.png')),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: value.eventList.length,
                                  separatorBuilder: (context, index) {
                                    return AppSize.kHeight20;
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
