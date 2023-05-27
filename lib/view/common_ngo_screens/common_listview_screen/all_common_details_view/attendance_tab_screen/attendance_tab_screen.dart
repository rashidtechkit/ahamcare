
import 'package:ahamcare/controller/home_controller/all_details_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AttendanceTabScreen extends StatelessWidget {
  AttendanceTabScreen({super.key, required this.id});
  final String id;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetDetailsController>(context, listen: false)
          .getAllDetails(context, id);
    });
    return Scaffold(
      body: Consumer<GetDetailsController>(builder: (context, value, child) {
        return value.isLoading == true
            ? const LoadingWidget()
            : SafeArea(
                child: SmartRefresher(
                  controller: refreshController,
                  enablePullDown: true,
                  header: const WaterDropMaterialHeader(),
                  onRefresh: () {
                    value.getAllDetails(context, id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: value.detailsList == null
                        ? const EmptyWidget()
                        : Column(
                            children: [
                              Material(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      const TextWidget(
                                        name: "Total attendance",
                                        fontSize: 16,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.diversity_1),
                                          AppSize.kWidth10,
                                          TextWidget(
                                            name: value.detailsList?.residence
                                                    .length
                                                    .toString() ??
                                                '0',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              AppSize.kHeight20,
                              Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    // log('${value.detailsList?.residence[1].photo}');
                                    return FadeInUp(
                                      child: Card(
                                        elevation: 10,
                                        surfaceTintColor: AppColors.kPurple,
                                        color: AppColors.kPurple,
                                        child: Stack(
                                          children: [
                                            const Positioned(
                                              top: -15,
                                              left: 10,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    AppColors.kDarkPink,
                                              ),
                                            ),
                                            ListTile(
                                              contentPadding:
                                                  const EdgeInsets.all(10),
                                              leading: CircleAvatar(
                                                radius: 40,
                                                // backgroundImage: NetworkImage(''
                                                //     // "${ApiBaseUrl.cloudUrl}/${value.detailsList?.residence[index].photo}"
                                                //     ),
                                              ),
                                              title: TextWidget(
                                                name: value
                                                        .detailsList
                                                        ?.residence[index]
                                                        .name ??
                                                    "",
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.kWhite,
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextWidget(
                                                    name:
                                                        "Age : ${value.detailsList?.residence[index].age ?? 0}",
                                                    color: AppColors.kWhite,
                                                  ),
                                                  TextWidget(
                                                    name:
                                                        "Place : ${value.detailsList?.residence[index].place ?? ''}",
                                                    color: AppColors.kWhite,
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ],
                                              ),
                                              trailing: const Icon(
                                                Icons
                                                    .contact_emergency_outlined,
                                                color: AppColors.kWhite,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount:
                                      value.detailsList?.residence.length ?? 0,
                                  separatorBuilder: (context, index) {
                                    return AppSize.kHeight20;
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              );
      }),
    );
  }
}
