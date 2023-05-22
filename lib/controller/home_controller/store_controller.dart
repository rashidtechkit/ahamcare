import 'package:ahamcare/model/home_model/store_model.dart';
import 'package:ahamcare/services/home_service/store_service.dart';
import 'package:ahamcare/view/store_events_screen/store_screen/store_screen.dart';
import 'package:flutter/material.dart';

class StoreController extends ChangeNotifier {
  bool isLoading = false;
  int activeIndex = 0;

  List<StoreModel> storeList = [];

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
