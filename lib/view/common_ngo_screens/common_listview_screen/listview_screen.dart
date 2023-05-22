import 'package:ahamcare/controller/home_controller/all_details_controller.dart';
import 'package:ahamcare/controller/home_controller/all_organization_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/common_ngo_screens/common_listview_screen/all_common_details_view/all_details_view.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommonListviewScreen extends StatelessWidget {
  CommonListviewScreen({
    super.key,
    required this.id,
  });
  final String id;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AllOrganizationController>(context, listen: false)
          .getAllOrganizations(context, id);
    });
    return Consumer2<AllOrganizationController, GetDetailsController>(
      builder: (context, value, details, child) {
        return Scaffold(
          body: value.isOrg == true
              ? const LoadingWidget()
              : SmartRefresher(
                  enablePullDown: true,
                  header: const WaterDropMaterialHeader(),
                  onRefresh: () {
                    value.getAllOrganizations(context, id);
                  },
                  controller: refreshController,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: value.organizations.isEmpty
                        ? const EmptyWidget()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppSize.kHeight10,
                              Row(
                                children: [
                                  TextWidget(
                                    name: "All Details",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.kBlack.withOpacity(0.3),
                                  ),
                                  AppSize.kWidth5,
                                  Icon(
                                    Icons.swipe_up_outlined,
                                    color: AppColors.kBlack.withOpacity(0.3),
                                  )
                                ],
                              ),
                              AppSize.kHeight10,
                              Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.only(bottom: 20),
                                  itemBuilder: (context, index) {
                                    return Material(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: AppColors.kWhite,
                                      surfaceTintColor: AppColors.kWhite,
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        title: TextWidget(
                                          name: value.organizations[index].name,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: 0.7,
                                        ),
                                        leading: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Icon(
                                            Icons.home,
                                            color: AppColors.kBlack
                                                .withOpacity(0.5),
                                          ),
                                        ),
                                        subtitle: TextWidget(
                                          name:
                                              value.organizations[index].place,
                                          color:
                                              AppColors.kBlack.withOpacity(0.7),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        trailing: Transform.rotate(
                                          angle: 4.7,
                                          child: const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: AppColors.kBlack,
                                            size: 40,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return AllCommonDetailsViewScreen(
                                                    id: value
                                                        .organizations[index]
                                                        .id,
                                                    name: value
                                                        .organizations[index]
                                                        .name);
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return AppSize.kHeight20;
                                  },
                                  itemCount: value.organizations.length,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
        );
      },
    );
  }
}
