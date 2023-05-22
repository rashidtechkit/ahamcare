import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/controller/home_controller/all_details_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:readmore/readmore.dart';

class DetailsTabScreen extends StatelessWidget {
  DetailsTabScreen({
    super.key,
    required this.id,
  });
  final String id;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetDetailsController>(context, listen: false)
          .getAllDetails(context, id);
    });
    return Consumer<GetDetailsController>(
      builder: (context, value, child) {
        return Scaffold(
          body: SafeArea(
            child: value.isLoading == true
                ? const LoadingWidget()
                : SmartRefresher(
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
                          : SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppSize.kHeight10,
                                  Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: AppColors.kLightPink,
                                      image: DecorationImage(
                                          image: NetworkImage(

                                              // ${ApiBaseUrl.cloudUrl}${value.detailsList?.photo} ??

                                              "https://cdn.shopify.com/s/files/1/0070/7032/files/best-free-stock-photo-websites.jpg?v=1619036042&width=1024"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  AppSize.kHeight10,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.kBlack.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                      ),
                                      AppSize.kHeight10,
                                      FadeInUp(
                                        delay:
                                            const Duration(milliseconds: 500),
                                        child: Row(
                                          children: [
                                            TextWidget(
                                              name:
                                                  value.detailsList?.name ?? '',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ],
                                        ),
                                      ),
                                      FadeInUp(
                                        delay:
                                            const Duration(milliseconds: 500),
                                        child: TextWidget(
                                          name: value.detailsList?.email ?? '',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      FadeInUp(
                                        delay:
                                            const Duration(milliseconds: 500),
                                        child: TextWidget(
                                          name: value.detailsList?.place ?? '',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      FadeInUp(
                                        delay:
                                            const Duration(milliseconds: 500),
                                        child: TextWidget(
                                          name: value.detailsList?.type ?? '',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      FadeInUp(
                                        delay:
                                            const Duration(milliseconds: 700),
                                        child: ReadMoreText(
                                          value.detailsList?.discription ??
                                              'No Description... dhsjkdhskjdh sdskdskdjskjdkjjskjdkjdksjdkj sdjskdjsk jskjdk',
                                          trimLines: 3,
                                          style: const TextStyle(fontSize: 16),
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: 'Show more',
                                          trimExpandedText: 'Show less',
                                          moreStyle: const TextStyle(
                                            fontSize: 14,
                                            color: AppColors.kDarkPink,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          lessStyle: const TextStyle(
                                            fontSize: 14,
                                            color: AppColors.kDarkPink,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      AppSize.kHeight10,
                                    ],
                                  )
                                ],
                              ),
                            ),
                    ),
                  ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(
                  Icons.picture_as_pdf,
                  color: AppColors.kWhite,
                ),
                label: const TextWidget(
                  name: "Click to view Doc",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kWhite,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
