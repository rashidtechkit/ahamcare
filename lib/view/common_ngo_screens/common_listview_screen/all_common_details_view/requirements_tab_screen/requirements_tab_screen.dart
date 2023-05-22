import 'dart:developer';
import 'package:ahamcare/controller/home_controller/all_details_controller.dart';
import 'package:ahamcare/controller/home_controller/old_age_home_controller.dart';
import 'package:ahamcare/controller/payment_controller/payment_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RequirementsTabScreen extends StatelessWidget {
  RequirementsTabScreen({Key? key, required this.id}) : super(key: key);

  final String id;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetDetailsController>(context, listen: false)
          .getAllDetails(context, id);
    });

    return Consumer<GetDetailsController>(builder: (context, value, child) {
      return Scaffold(
          body: value.isLoading == true
              ? const LoadingWidget()
              : value.detailsList!.requirement.isEmpty
                  ? SmartRefresher(
                      controller: refreshController,
                      enablePullDown: true,
                      header: const WaterDropMaterialHeader(),
                      onRefresh: () {
                        value.getAllDetails(context, id);
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset("assets/images/98979-empy-list.json"),
                            const Text("Oops! The list is empty...")
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        AppSize.kHeight10,
                        Row(
                          children: [
                            AppSize.kWidth20,
                            TextWidget(
                              name: "Pick your items",
                              color: AppColors.kBlack.withOpacity(0.5),
                            ),
                            AppSize.kWidth5,
                            Icon(
                              Icons.swipe_up_outlined,
                              color: AppColors.kBlack.withOpacity(0.5),
                            )
                          ],
                        ),
                        Expanded(
                          child: SmartRefresher(
                            controller: refreshController,
                            enablePullDown: true,
                            header: const WaterDropMaterialHeader(),
                            onRefresh: () {
                              value.getAllDetails(context, id);
                            },
                            child: ListView.separated(
                              padding: const EdgeInsets.all(15),
                              itemBuilder: (context, index) {
                                if (value.needsControllerList.length <= index) {
                                  value.needsControllerList
                                      .add(TextEditingController());
                                }

                                final itemKey = GlobalKey<FormState>();

                                return Form(
                                  key: itemKey,
                                  child: Material(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: CheckboxListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      contentPadding: const EdgeInsets.all(10),
                                      value: (value.isCheckedList != null &&
                                              index <
                                                  value.isCheckedList.length)
                                          ? value.isCheckedList[index]
                                          : false,
                                      onChanged: (data) {
                                        value.onChange(
                                          data,
                                          index,
                                        );
                                      },
                                      title: Row(
                                        children: [
                                          TextWidget(
                                            name: value.detailsList
                                                    ?.requirement[index].item ??
                                                '',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: AppColors.kPurple,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                              child: TextWidget(
                                                fontSize: 14,
                                                name:
                                                    "${value.detailsList?.requirement[index].needs.toString()} ${value.detailsList?.requirement[index].requirementUnit.toString()}",
                                                color: AppColors.kWhite,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Material(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Center(
                                                      child: TextWidget(
                                                        name:
                                                            "Total : ₹${value.detailsList?.requirement[index].totalPrice}",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Material(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Center(
                                                      child: TextWidget(
                                                        name:
                                                            "per : ₹${value.detailsList?.requirement[index].unitPrice}",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: SizedBox(
                                                    height: 40,
                                                    child: TextFormField(
                                                      onChanged: (count) {
                                                        int parsedCount = int
                                                                .tryParse(
                                                                    count) ??
                                                            0; // Convert string to int or default to 0
                                                        value.onChangeamount(
                                                            parsedCount, index);
                                                      },
                                                      keyboardType:
                                                          TextInputType.number,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      controller: value
                                                              .needsControllerList[
                                                          index],
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Enter Your Contribution count',
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 8,
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: AppColors
                                                                .kPurple,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter a value';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return AppSize.kHeight30;
                              },
                              itemCount:
                                  value.detailsList?.requirement.length ?? 0,
                            ),
                          ),
                        ),
                      ],
                    ),
          bottomNavigationBar: Consumer3<OldAgeHomeController,
                  PaymentController, GetDetailsController>(
              builder: (context, value, payment, details, child) {
            return details.detailsList!.requirement.isEmpty
                ? const SizedBox()
                : Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                      children: [
                        AppSize.kWidth20,
                      ],
                    ),
                    Consumer3<OldAgeHomeController, PaymentController,
                            GetDetailsController>(
                        builder: (context, value, payment, details, child) {
                      return details.detailsList!.requirement.isEmpty
                          ? const SizedBox()
                          : Material(
                              elevation: 10,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Column(
                                      children: [
                                        const TextWidget(
                                          name: "Total Amount",
                                          fontWeight: FontWeight.w500,
                                        ),
                                        TextWidget(
                                          name: '${details.totalAmount}',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width:
                                        MediaQuery.of(context).size.width / 1.9,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // if (_formKey.currentState!.validate()) {
                                        details.addOrder(
                                          context: context,
                                          id: id,
                                          detailsList: details.detailsList!,
                                          needsControllerList:
                                              details.needsControllerList,
                                        );
                                        payment.setOptions(value.totalAmount);
                                        // }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.kPurple,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                      child: const TextWidget(
                                        name: "Payment",
                                        color: AppColors.kWhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ));
                    })
                  ]);
          }));
    });
  }
}
