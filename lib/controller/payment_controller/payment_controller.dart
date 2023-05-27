import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends ChangeNotifier {
  Razorpay razorpay = Razorpay();
  String? paymentsid = '';

  // List<Product> products = [];

  Map<String, dynamic> options = {};

  void setOptions(amountPayable) async {
    options = {
      // 'key': 'rzp_live_roUrAjz5ezEQKH',
      // 'key': 'rzp_test_boWotLKxahxvUM',
      'key': 'rzp_test_9djO1gFo5qkqVq',
      'amount': amountPayable * 100,
      'name': 'Aahamcare',
      'description': 'Mobile Phones',
      'prefill': {'contact': '8848066170', 'email': 'info.aahamcare.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
        paymentsid = response.paymentId!;
        notifyListeners();
        handlePaymentSuccess(response);
      });
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse response) {
        handlePaymentError(response);
      });
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
          (ExternalWalletResponse response) {
        handleExternalWallet(response);
      });
    } on PaymentFailureResponse catch (e) {
      log(e.error.toString());
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "SUCCESS:${response.paymentId}",
      timeInSecForIosWeb: 4,
    );
    log(response.toString());
    log(response.paymentId.toString());

    // orderProducts( 'ONLINE_PAYMENT');
    notifyListeners();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR:${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
    notifyListeners();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET:${response.walletName}", timeInSecForIosWeb: 4);
    notifyListeners();
  }

  bool isloading = false;
  // Future<void> orderProducts(String addressId, paymentType) async {
  //   loading = true;
  //   notifyListeners();
  //   final OrdersModel model = OrdersModel(
  //     addressId: addressId,
  //     paymentType: paymentType,
  //     products: products,
  //   );

  //   await OrderService().placeOrder(model).then((value) {
  //     if (value != null) {
  //       loading = false;
  //       notifyListeners();
  //       NavigationService.navigatorKey.currentState?.push(
  //         CupertinoPageRoute(
  //           builder: (context) {
  //             return const OrderScreen();
  //           },
  //         ),
  //       ).then(
  //         (value) =>
  //             NavigationService.navigatorKey.currentState?.pushAndRemoveUntil(
  //           CupertinoPageRoute(
  //             builder: (context) {
  //               return const BottomNav();
  //             },
  //           ),
  //           (route) => false,
  //         ),
  //       );
  //       notifyListeners();
  //     } else {
  //       loading = false;
  //       notifyListeners();
  //     }
  //   });
  // }
}
