import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/store_events_screen/store_screen/payment_store.dart';
import 'package:ahamcare/view/widgets/carousal_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ahamcare/controller/home_controller/store_controller.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  static const routeName = '/store_screen.dart';

  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context)?.settings.arguments as String;
    // final provider = Provider.of<StoreController>(context, listen: false)
    //     .findById(productId);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<StoreController>(context, listen: false).getStore(context);
    });
    return Scaffold(
      body: SafeArea(
        child: Consumer<StoreController>(
          builder: (context, value, child) {
            return value.isLoading == true
                ? const LoadingWidget()
                : RefreshIndicator(
                    onRefresh: () {
                      return value.getStore(context);
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // CarousalWidget(
                          //   value: value,
                          // ),
                          // AppSize.kHeight20,
                          // Row(
                          //   children: [
                          //     AppSize.kWidth20,
                          //     TextWidget(
                          //       name: "Checkout Vouchers",
                          //       fontSize: 16,
                          //       color: AppColors.kBlack.withOpacity(0.4),
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //     AppSize.kWidth5,
                          //     Icon(
                          //       Icons.swipe_up,
                          //       color: AppColors.kBlack.withOpacity(0.4),
                          //     ),
                          //   ],
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: FadeInUp(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 15,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return ProductVeiw(
                                            name: value.storeList[index].item,
                                            price: value
                                                .storeList[index].unitPrice,
                                            img:
                                                '${ApiBaseUrl.cloudUrl}${value.storeList[index].photo}',
                                          );
                                        },
                                      ));
                                    },
                                    child: Stack(
                                      children: [
                                        Material(
                                          elevation: 10,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  color: AppColors.kGrey,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        '${ApiBaseUrl.cloudUrl}${value.storeList[index].photo}'),
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                              ),
                                              TextWidget(
                                                name:
                                                    value.storeList[index].item,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              TextWidget(
                                                name:
                                                    '₹ ${value.storeList[index].unitPrice.toString()}',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              // Padding(
                                              //   padding:
                                              //       const EdgeInsets.all(8.0),
                                              //   child: SizedBox(
                                              //     width: 130,
                                              //     height: 30,
                                              //     child: ElevatedButton(
                                              //       style:
                                              //           ElevatedButton.styleFrom(
                                              //         backgroundColor:
                                              //             AppColors.kPurple,
                                              //       ),
                                              //       onPressed: () {
                                              //         Navigator.of(context)
                                              //             .push(MaterialPageRoute(
                                              //           builder: (context) {
                                              //             return CheckoutScreen(
                                              //               index: index,
                                              //             );
                                              //           },
                                              //         ));
                                              //       },
                                              //       child: TextWidget(
                                              //         name: "Buy Now",
                                              //         color: AppColors.kWhite,
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 90,
                                          decoration: const BoxDecoration(
                                            color: AppColors.kOrange,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Center(
                                            child: TextWidget(
                                              name:
                                                  "${value.storeList[index].remaining.toString()} ${value.storeList[index].unit.toString()} Left",
                                              color: AppColors.kWhite,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: value.storeList.length,
                              ),
                            ),
                          )
                          // FadeInUp(
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(10.0),
                          //     child: ListView.separated(
                          //       physics: const BouncingScrollPhysics(),
                          //       shrinkWrap: true,
                          //       itemBuilder: (context, index) {
                          //         return Material(
                          //           elevation: 10,
                          //           borderRadius: BorderRadius.circular(10),
                          //           child: ExpansionTile(
                          //             leading: Container(
                          //               height: 100,
                          //               width: 100,
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(10),
                          //                 image: const DecorationImage(
                          //                   fit: BoxFit.cover,
                          //                   image: NetworkImage(
                          //                     'https://hicaps.com.ph/wp-content/uploads/2022/01/food-packaging-materials-3-e1657177298323.png',
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //             title: TextWidget(
                          //               name: value.storeList[index].item,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 16,
                          //             ),
                          //             subtitle: TextWidget(
                          //                 name:
                          //                     " ${value.storeList[index].remaining.toString()} / ${value.storeList[index].requirement.toString()} ,"),
                          //             children: [
                          //               Padding(
                          //                 padding: const EdgeInsets.all(10.0),
                          //                 child: Column(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   children: [
                          //                     ReadMoreText(
                          //                       value.storeList[index]
                          //                           .discription,
                          //                       trimLines: 2,
                          //                       textAlign: TextAlign.left,
                          //                       trimMode: TrimMode.Line,
                          //                       trimCollapsedText: 'Show more',
                          //                       trimExpandedText: 'Show less',
                          //                       moreStyle: const TextStyle(
                          //                         fontSize: 12,
                          //                         color: AppColors.kDarkPink,
                          //                         fontWeight: FontWeight.bold,
                          //                       ),
                          //                       lessStyle: const TextStyle(
                          //                         fontSize: 12,
                          //                         color: AppColors.kDarkPink,
                          //                         fontWeight: FontWeight.bold,
                          //                       ),
                          //                     ),
                          //                     FittedBox(
                          //                       child: Row(
                          //                         children: [
                          //                           InkWell(
                          //                             // onTap: () {
                          //                             //   cart.incrementDecrementQty(
                          //                             //     -1,
                          //                             //     cart
                          //                             //         .cartList!
                          //                             //         .products[index]
                          //                             //         .product
                          //                             //         .id,
                          //                             //     cart.cartList!
                          //                             //         .products[index].qty,
                          //                             //     context,
                          //                             //     cart
                          //                             //         .cartList!
                          //                             //         .products[index]
                          //                             //         .product
                          //                             //         .size
                          //                             //         .toString(),
                          //                             //   );
                          //                             // },
                          //                             child: Container(
                          //                               height: 25,
                          //                               width: 25,
                          //                               decoration:
                          //                                   BoxDecoration(
                          //                                 border: Border.all(),
                          //                                 shape:
                          //                                     BoxShape.circle,
                          //                               ),
                          //                               child: const Icon(
                          //                                 Icons.remove,
                          //                                 size: 20,
                          //                               ),
                          //                             ),
                          //                           ),
                          //                           AppSize.kWidth10,
                          //                           Container(
                          //                             height: 25,
                          //                             width: 40,
                          //                             decoration: BoxDecoration(
                          //                               border: Border.all(),
                          //                               borderRadius:
                          //                                   BorderRadius
                          //                                       .circular(10),
                          //                             ),
                          //                             child: const Text(
                          //                               '1',
                          //                               // "${cart.cartList!.products[index].qty}",
                          //                               textAlign:
                          //                                   TextAlign.center,
                          //                               style: TextStyle(
                          //                                   fontSize: 16),
                          //                             ),
                          //                           ),
                          //                           AppSize.kWidth10,
                          //                           InkWell(
                          //                             // onTap: () {
                          //                             //   cart.incrementDecrementQty(
                          //                             //     1,
                          //                             //     cart
                          //                             //         .cartList!
                          //                             //         .products[index]
                          //                             //         .product
                          //                             //         .id,
                          //                             //     cart.cartList!
                          //                             //         .products[index].qty,
                          //                             //     context,
                          //                             //     cart
                          //                             //         .cartList!
                          //                             //         .products[index]
                          //                             //         .product
                          //                             //         .size
                          //                             //         .toString(),
                          //                             //   );
                          //                             // },
                          //                             child: Container(
                          //                               height: 25,
                          //                               width: 25,
                          //                               decoration:
                          //                                   BoxDecoration(
                          //                                 border: Border.all(),
                          //                                 shape:
                          //                                     BoxShape.circle,
                          //                               ),
                          //                               child: const Icon(
                          //                                 Icons.add,
                          //                                 size: 20,
                          //                               ),
                          //                             ),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         );
                          //       },
                          //       itemCount: value.storeList.length,
                          //       separatorBuilder: (context, index) =>
                          //           AppSize.kHeight20,
                          //     ),
                          //   ),
                          // ),
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
