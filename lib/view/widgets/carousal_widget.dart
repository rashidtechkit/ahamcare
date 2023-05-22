import 'package:ahamcare/controller/home_controller/store_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarousalWidget extends StatelessWidget {
  const CarousalWidget({super.key, required this.value});
  final StoreController value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 4,
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://elements-cover-images-0.imgix.net/2e4d8d68-5399-44d4-915d-eb4f8588e4d1?auto=compress%2Cformat&fit=max&w=900&s=f5bf44ec1e83dbe11b9b36bb57fcee9c',
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              value.getProductCarousel(index);
            },
          ),
        ),
        AppSize.kHeight10,
        AnimatedSmoothIndicator(
          activeIndex: value.activeIndex,
          count: 4,
          effect: WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: AppColors.kGrey,
            activeDotColor: const Color.fromRGBO(
              146,
              85,
              253,
              1.000,
            ),
          ),
        ),
      ],
    );
  }
}
