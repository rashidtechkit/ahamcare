import 'package:ahamcare/model/home_model/home_model.dart';
import 'package:ahamcare/services/home_service/home_service.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = false;

  List<HomeModel> homeList = [];
  //GetAllOrganizationsModel? organizations;

  Future<void> getHome(context) async {
    isLoading = true;
    notifyListeners();
    await HomeService().getHomeService(context).then(
      (value) {
        if (value != null) {
          homeList = value;
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
