import 'package:ahamcare/model/home_model/event_model.dart';
import 'package:ahamcare/model/payment_model/event_payment_model.dart';
import 'package:ahamcare/services/home_service/event_service.dart';
import 'package:ahamcare/services/payment_id_service/event_payment_id_service.dart';
import 'package:flutter/material.dart';

class EventController extends ChangeNotifier {
  bool isLoading = false;
  EventPaymentmodel? eventPaymentmodel;
  List<EventModel> eventList = [];
  int count = 0;
  void incrementCount() {
    count++;
    notifyListeners();
  }

  void decrementCount() {
    if (count > 0) {
      count--;
      notifyListeners();
    }
  }

  int gettotal(id) {
    final EventModel product =
        eventList.firstWhere((element) => element.id == id);

    return product.unitPrice * count;
  }

  Future<void> getpaymentId(storeId, context, paymentId) async {
    isLoading = true;
    notifyListeners();
    await EventPaymentIdService()
        .paymentId(storeId, context, paymentId, count)
        .then(
      (value) {
        if (value != null) {
          eventPaymentmodel = value as EventPaymentmodel?;
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

  Future<void> getEvent(context) async {
    isLoading = true;
    notifyListeners();
    await EventService().getEvent(context).then(
      (value) {
        if (value != null) {
          eventList = value;
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
}
