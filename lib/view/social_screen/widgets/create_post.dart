import 'package:ahamcare/controller/home_controller/old_age_home_controller.dart';
import 'package:ahamcare/controller/social_controller/social_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/loading_widget.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context)?.settings.arguments as String;
    // final provider = Provider.of<OldAgeHomeController>(context, listen: false)
    //     .findById(productId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.kWhite,
          ),
        ),
        title: const TextWidget(
          name: "New Post",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.kWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<SocialController>(builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                value.isLoading == true
                    ? const LoadingWidget()
                    : Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(value.useravatar!),
                          ),
                          color: AppColors.kGrey,
                        ),
                      ),
                AppSize.kHeight10,
                TextFormField(
                  maxLength: 100,
                  controller: value.description,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    hintText: "Write a caption...",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                AppSize.kHeight10,
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kRed,
                      ),
                      child: const TextWidget(
                        name: "Cancel",
                        color: AppColors.kWhite,
                      ),
                    ),
                    AppSize.kWidth10,
                    ElevatedButton(
                      onPressed: () {
                        value.addPost(
                          context,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPurple,
                      ),
                      child: const TextWidget(
                        name: "Upload",
                        color: AppColors.kWhite,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            right: -10,
            bottom: -10,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.kPurple.withOpacity(0.4),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: AppColors.kPurple.withOpacity(0.4),
                ),
              ),
            ),
          ),
          Row(
            children: const [
              Image(
                height: 140,
                image: AssetImage(
                    'assets/images/mobile-feed-concept-illustration_114360-4949-removebg-preview.png'),
              ),
              AppSize.kWidth10,
              TextWidget(
                  name:
                      "Share your deeds socially\n and makes your moment\n beautiful"),
            ],
          ),
        ],
      ),
    );
  }
}
