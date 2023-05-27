import 'package:ahamcare/controller/payment_controller/payment_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../controller/home_controller/event_controller.dart';

class EventView extends StatelessWidget {
  const EventView(
      {super.key,
      required this.moviename,
      required this.price,
      required this.starttime,
      required this.endtime,
      required this.id});

  final String moviename;
  final int price;
  final dynamic starttime;
  final dynamic endtime;
  final String id;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<EventController>(context, listen: false).getEvent(context);
    });
    return Consumer2<EventController, PaymentController>(
      builder: (context, value, value2, child) {
        return Scaffold(
          appBar: AppBar(
              //title: Text(moviename.toString()),
              ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.kBlack,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(moviename.toString()),
                      AppSize.kHeight20,
                      Row(
                        children: [
                          AppSize.kHeight10,
                          Text('Movie Price : ${price.toString()}'),
                        ],
                      ),
                      AppSize.kHeight10,
                      Text('Start time:${starttime.toString()}'),
                      AppSize.kHeight20,
                      Text('end time: ${endtime.toString()}'),
                      AppSize.kHeight20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () => value.decrementCount(),
                              child: Icon(Icons.remove),
                            ),
                          ),
                          Text(value.count.toString()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () => value.incrementCount(),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                      SlideCountdown(
                        duration: Duration(days: 3),
                      ),
                      AppSize.kHeight10,
                      Text('Total Price :${value.gettotal(id).toString()}')
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: ElevatedButton(
              onPressed: () {
                value2.setOptions(value.gettotal(id));
              },
              child: Text("Check Out")),
        );
      },
    );
  }
}
