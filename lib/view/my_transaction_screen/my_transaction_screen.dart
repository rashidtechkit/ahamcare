import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MyTransactionScreen extends StatelessWidget {
  const MyTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const TextWidget(
          name: "My Transaction",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AppSize.kHeight10,
            Row(
              children: [
                AppSize.kWidth10,
                TextWidget(
                  name: 'See all transaction',
                  color: AppColors.kBlack.withOpacity(0.4),
                ),
                Icon(
                  Icons.swipe_up_outlined,
                  color: AppColors.kBlack.withOpacity(0.4),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 20),
                itemBuilder: (context, index) {
                  return FadeInLeft(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      leading: const CircleAvatar(
                        child: Icon(
                          Icons.wallet,
                        ),
                      ),
                      title: const TextWidget(
                        name: "Paid to SnehaSadan",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.7,
                      ),
                      subtitle: TextWidget(
                        name: "Today,09:24 AM",
                        color: AppColors.kBlack.withOpacity(0.7),
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const TextWidget(
                        name: "₹200",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      onTap: () {},
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemCount: 10,
                // value.oldAgeList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
