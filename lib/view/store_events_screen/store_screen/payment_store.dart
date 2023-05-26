import 'package:ahamcare/api/api_base_url.dart';
import 'package:ahamcare/controller/home_controller/store_controller.dart';
import 'package:ahamcare/controller/payment_controller/payment_controller.dart';
import 'package:ahamcare/utils/colors/colors.dart';
import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductVeiw extends StatelessWidget {
  final dynamic name;
  final String img;
  final dynamic price;
  final String id;

  const ProductVeiw({
    super.key,
    required this.name,
    required this.img,
    required this.price,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<StoreController>(context, listen: false).getStore(context);
    });
    return Consumer2<StoreController, PaymentController>(
      builder: (context, value, value2, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Products"),
            centerTitle: true,
            elevation: 6,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                  img,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.kBlack),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '₹ ${price}',
                        style: TextStyle(fontSize: 16),
                      ),
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
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Price:${value.gettotal(id).toString()}'),
                ],
              ),
            ],
          ),
          bottomNavigationBar: ElevatedButton(
              onPressed: () {
                value2.setOptions(value.gettotal(id));
              },
              child: Text("CHECK OUT")),
        );
      },
    );
  }
}
