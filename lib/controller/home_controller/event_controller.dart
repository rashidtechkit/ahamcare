import 'package:ahamcare/model/home_model/event_model.dart';
import 'package:ahamcare/services/home_service/event_service.dart';
import 'package:flutter/material.dart';

class EventController extends ChangeNotifier {
  bool isLoading = false;

  List<EventModel> eventList = [];

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
