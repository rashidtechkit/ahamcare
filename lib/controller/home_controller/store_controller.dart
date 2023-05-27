import 'package:ahamcare/model/home_model/store_model.dart';
import 'package:ahamcare/model/payment_model/payment_model.dart';
import 'package:ahamcare/services/home_service/store_service.dart';
import 'package:ahamcare/services/payment_id_service/payment_id_service.dart';
import 'package:ahamcare/view/store_events_screen/store_screen/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class StoreController extends ChangeNotifier {
  bool isLoading = false;
  int activeIndex = 0;

  List<StoreModel> storeList = [];
  PaymentSuccessResponse? paymentSuccessResponse;

  int count = 1;
  EventPaymentmodel? paymentmodel;
  void incrementCount() {
    count++;
    notifyListeners();
  }

  void decrementCount() {
    if (count > 1) {
      count--;
      notifyListeners();
    }
  }

  int gettotal(id) {
    final StoreModel product =
        storeList.firstWhere((element) => element.id == id);

    return product.unitPrice * count;
  }

  Future<void> getStore(context) async {
    isLoading = true;
    notifyListeners();
    await StoreService().getStore(context).then(
      (value) {
        if (value != null) {
          storeList = value;
          notifyListeners();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          return null;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> getpaymentId(storeId, context, paymentId) async {
    isLoading = true;
    notifyListeners();
    await PaymentIdService().paymentId(storeId, context, paymentId, count).then(
      (value) {
        if (value != null) {
          paymentmodel = value;
          notifyListeners();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          return null;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void getProductCarousel(index) {
    activeIndex = index;
    notifyListeners();
  }

  StoreModel findById(String id) {
    return storeList.firstWhere((element) => element.id == id);
  }

  void toDetailsScreen(context, index) {
    Navigator.of(context)
        .pushNamed(StoreScreen.routeName, arguments: storeList[index].id);
  }

  void goBackHome(context) {
    Navigator.of(context).pop();
    activeIndex = 0;
    notifyListeners();
  }
}
