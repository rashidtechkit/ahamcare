import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/controller/social_controller/social_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SocialController>(context, listen: false).getSocial(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          name: "Socially",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        actions: [
          Consumer<SocialController>(
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  value.pickimage(context);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.add),
                ),
              );
            },
          ),
          AppSize.kWidth20,
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer<SocialController>(
          builder: (context, value, child) {
            return value.isLoading == true
                ? const Center(child: LoadingWidget())
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        AppSize.kHeight10,
                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return AppSize.kHeight20;
                          },
                          physics: const BouncingScrollPhysics(),
                          itemCount: value.socialList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return value.socialList.isEmpty
                                ? const EmptyWidget()
                                : Card(
                                    elevation: 10,
                                    surfaceTintColor: AppColors.kWhite,
                                    color: AppColors.kWhite,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const CircleAvatar(),
                                              AppSize.kWidth10,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  TextWidget(
                                                    name: "George Nicolas",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                  TextWidget(
                                                    name: "1hr ago.",
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              LikeButton(
                                                size: 20,
                                                isLiked: value.isLiked,
                                                bubblesColor: BubblesColor(
                                                  dotPrimaryColor:
                                                      AppColors.kRed,
                                                  dotSecondaryColor:
                                                      AppColors.kGrey,
                                                ),
                                                // onTap: (isLiked) {
                                                //   //return value.addPost(userId, context, photo, description, index)
                                                // },
                                              ),
                                            ],
                                          ),
                                          AppSize.kHeight10,
                                          value.isLoading == true
                                              ? const LoadingWidget()
                                              : Container(
                                                  height: 300,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        image: NetworkImage(value
                                                                .socialList
                                                                .isNotEmpty
                                                            ? "${ApiBaseUrl.cloudUrl}${value.socialList[index].image}"
                                                            : "https://img.mensxp.com/media/content/2021/Jan/South-Indian-Actors-With-Great-Sense-Of-Style-3_600d82fbe65ab.jpeg?w=900&h=1200&cc=1"),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                          AppSize.kHeight10,
                                          ReadMoreText(
                                            value.socialList[index]
                                                    .discription ??
                                                '',
                                            trimLines: 3,
                                            style:
                                                const TextStyle(fontSize: 14),
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
                                          AppSize.kHeight10,
                                        ],
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
