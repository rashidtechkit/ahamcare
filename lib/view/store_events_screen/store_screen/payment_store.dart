import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:book_my_sporz/Utils/app_constrants.dart';
import 'package:book_my_sporz/common/api/api_base_url.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

List sizes = [7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5];

class ProductVeiw extends StatelessWidget {
  final String name;
  final String img;
  final String price;

  final String rate;

  const ProductVeiw({
    super.key,
    required this.name,
    required this.img,
    required this.price,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar(context)),
      bottomNavigationBar: getFooter(context),
      body: getBody(context),
    );
  }

  Widget getAppBar(context) {
    return AppBar(
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.kBaseWhite.withOpacity(0.2),
            ),
            color: AppColors.kBaseColor.withOpacity(0.1),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: AppColors.kGreen,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.kBaseWhite,
      elevation: 0,
      title: const Text(
        "Product Details",
        style: TextStyle(
          color: AppColors.kBaseWhite,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget getFooter(context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.kRed, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "More",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.kWhite,
                    fontSize: 18),
              ),
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 35,
                    decoration: BoxDecoration(
                      color: AppColors.kWhite.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.kWhite),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: AppColors.kWhite,
                                borderRadius: BorderRadius.circular(4)),
                            child: const Center(
                                child: Icon(
                              Icons.remove,
                              color: AppColors.kBaseWhite,
                            )),
                          ),
                          const Text(
                            "1",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.kWhite,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: AppColors.kWhite,
                                borderRadius: BorderRadius.circular(4)),
                            child: const Center(
                                child: Icon(
                              Icons.add,
                              color: AppColors.kWhite,
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kWhite.withOpacity(0.15),
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "₹ ",
                    style: TextStyle(
                        color: AppColors.kWhite,
                        fontSize: 25,
                        fontFamily: 'NONE',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '%${rate}off',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.25,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: List.generate(1, (index) {
                      return SizedBox(
                        width: 70,
                        height: 70,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color:
                                            AppColors.kWhite.withOpacity(0.1)),
                                    color: AppColors.kWhite),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Flexible(
                child: FadeIn(
                  duration: const Duration(milliseconds: 1400),
                  child: SizedBox(
                    height: 350,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(120),
                                    topLeft: Radius.circular(120),
                                    topRight: Radius.circular(40)),
                                color: AppColors.kBaseBlack.withOpacity(0.12)),
                          ),
                        ),
                        SizedBox(
                          height: 270,
                          child: img.isNotEmpty
                              ? Image.network(
                                  img,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  'https://imgs.search.brave.com/V9nx1ys5MsS1-ix0h-qjw1p25XBUsuXO9W_A-2kwTzs/rs:fit:1200:1010:1/g:ce/aHR0cDovL3d3dy5i/YW5kdC5jb20uYXUv/aW5mb3JtYXRpb24v/dXBsb2Fkcy8yMDE1/LzA5L2dldHR5My5q/cGc',
                                  fit: BoxFit.cover,
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.15,
                child: const Text(
                  "Sizes",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(sizes.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColors.kWhite.withOpacity(0.2))),
                          child: Center(
                            child: Text(
                              sizes[index].toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
